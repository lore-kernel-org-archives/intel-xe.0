Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C6C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 08:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04EA10E376;
	Mon, 21 Sep 2026 08:36:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C15C10E359;
 Mon, 21 Sep 2026 08:36:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6061118695117151971=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/dp=3A_Disable_DC5?=
 =?utf-8?q?/6_before_AUX_programming_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 08:36:53 -0000
Message-ID: <178997981336.185577.11021599440090441572@61270ab9df2a>
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

--===============6061118695117151971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Disable DC5/6 before AUX programming (rev4)
URL   : https://patchwork.freedesktop.org/series/174474/
State : failure

== Summary ==

CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf_FULL -> xe-pw-174474v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174474v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174474v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174474v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][1] +158 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +363 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_exec_system_allocator@twice-large-new-race:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +28 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-new-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@twice-large-new-race.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][7] ([Intel XE#2370]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][11] ([Intel XE#1124]) -> [SKIP][12] +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][13] ([Intel XE#7679]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][15] ([Intel XE#367]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][17] ([Intel XE#7358]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][19] ([Intel XE#2252]) -> [SKIP][20] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][21] ([Intel XE#3304] / [Intel XE#7374]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][23] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][25] ([Intel XE#2320]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][27] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][29] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][31] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][33] ([Intel XE#8265]) -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][35] ([Intel XE#2373] / [Intel XE#7448]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][37] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][39] ([Intel XE#2311]) -> [SKIP][40] +35 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][41] ([Intel XE#4141]) -> [SKIP][42] +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][43] ([Intel XE#7061]) -> [SKIP][44] +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-bmg:          [INCOMPLETE][45] ([Intel XE#9259]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][47] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][48] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#2313]) -> [SKIP][50] +37 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          [SKIP][51] ([Intel XE#7283]) -> [SKIP][52] +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][53] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][55] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][57] ([Intel XE#1489]) -> [SKIP][58] +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][59] ([Intel XE#2234]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_psr@psr2-primary-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][61] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][62] +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][63] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          [SKIP][65] ([Intel XE#8370]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][67] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][68] +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][69] ([Intel XE#8578]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-multi-queue:
    - shard-bmg:          [SKIP][71] ([Intel XE#8374]) -> [SKIP][72] +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          [SKIP][73] ([Intel XE#8364]) -> [SKIP][74] +19 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-bmg:          [SKIP][75] ([Intel XE#8369]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-fd.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - shard-bmg:          [DMESG-WARN][77] -> [SKIP][78] +23 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro:
    - shard-bmg:          [DMESG-WARN][79] ([Intel XE#9331]) -> [SKIP][80] +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@once-large-mmap-remap-ro.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@once-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [DMESG-WARN][81] ([Intel XE#9309]) -> [SKIP][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [SKIP][83] -> [DMESG-WARN][84] +33 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][85] ([Intel XE#8378]) -> [SKIP][86] +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_madvise@per-vma-protection:
    - shard-bmg:          [DMESG-WARN][87] ([Intel XE#9331]) -> [DMESG-WARN][88] +7 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_madvise@per-vma-protection.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-3/igt@xe_madvise@per-vma-protection.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [FAIL][89] ([Intel XE#7695]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][91] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [SKIP][93] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][94] +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  
Known issues
------------

  Here are the changes found in xe-pw-174474v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#8749])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2327])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1124]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1467] / [Intel XE#7367])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1124])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#7679])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#9329]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#9329])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2652]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2887])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3432])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2887]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#7358])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#7358])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2252]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#373]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#6969]) +34 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][115] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1468] / [Intel XE#7396])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2320])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#309] / [Intel XE#7343])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#8329])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1340] / [Intel XE#7435])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#8265])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#8265])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4422] / [Intel XE#7442])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#301]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#7179])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#7178] / [Intel XE#7351])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#7061] / [Intel XE#7356])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#6312]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4141]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#7061] / [Intel XE#7356])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2311]) +13 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#7865]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#7061]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#7905]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2350] / [Intel XE#7503])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2313]) +11 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8395] / [Intel XE#8396])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8396]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][145] ([Intel XE#8399])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#8710])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1489]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1406])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2330] / [Intel XE#5813])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1499] / [Intel XE#9271])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_vrr@flip-dpms.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#6540] / [Intel XE#688])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#7482]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1392]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2322] / [Intel XE#7372])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#8374])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#8374]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#8364]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#8364]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:
    - shard-bmg:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#9331]) +2 other tests dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#8378])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8378])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#9203])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#6964])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#7793])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#7793])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#5694] / [Intel XE#7370])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2284] / [Intel XE#7370])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][172] -> [INCOMPLETE][173] ([Intel XE#8175])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@xe_pm@s3-exec-after.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [PASS][174] -> [FAIL][175] ([Intel XE#8555]) +1 other test fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-50.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#4733] / [Intel XE#7417])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#944])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#8339])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          [SKIP][179] ([Intel XE#8749]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind-with-load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][181] ([Intel XE#2134]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@fbdev@read.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][183] ([Intel XE#9329]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][185] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [INCOMPLETE][187] ([Intel XE#9241]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][189] ([Intel XE#8710]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_vrr@flip-basic-fastset:
    - {shard-ptl}:        [FAIL][191] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@flip-basic-fastset.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][193] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][195] -> [PASS][196] +456 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#9331]) -> [PASS][198] +6 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-3/igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [DMESG-WARN][199] -> [PASS][200] +27 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - {shard-ptl}:        [WARN][201] -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][203] -> [SKIP][204] ([Intel XE#2327]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][205] -> [SKIP][206] ([Intel XE#7059] / [Intel XE#7085])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][207] -> [SKIP][208] ([Intel XE#1124]) +8 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][209] -> [SKIP][210] ([Intel XE#367]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][211] ([Intel XE#2887]) -> [SKIP][212] ([Intel XE#9329]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][213] ([Intel XE#9329]) -> [SKIP][214] ([Intel XE#2652])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][215] ([Intel XE#3432]) -> [SKIP][216] ([Intel XE#9329]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][217] ([Intel XE#9329]) -> [SKIP][218] ([Intel XE#3432])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][219] ([Intel XE#9329]) -> [SKIP][220] ([Intel XE#2887]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][221] -> [SKIP][222] ([Intel XE#2325] / [Intel XE#7358])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][223] -> [SKIP][224] ([Intel XE#7358])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][225] -> [SKIP][226] ([Intel XE#2252]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][227] -> [SKIP][228] ([Intel XE#6507] / [Intel XE#7358])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          [SKIP][229] ([Intel XE#6507]) -> [SKIP][230] ([Intel XE#6507] / [Intel XE#7358])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][231] -> [SKIP][232] ([Intel XE#6974])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][233] -> [FAIL][234] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@srm.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][235] -> [SKIP][236] ([Intel XE#7642])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@type1.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][237] -> [SKIP][238] ([Intel XE#2320]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][239] -> [SKIP][240] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][241] -> [SKIP][242] ([Intel XE#2286] / [Intel XE#6035])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][243] -> [SKIP][244] ([Intel XE#8265]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][245] -> [SKIP][246] ([Intel XE#8586])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][247] -> [SKIP][248] ([Intel XE#7178] / [Intel XE#7349])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][249] -> [SKIP][250] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][251] -> [SKIP][252] ([Intel XE#2311]) +42 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][253] -> [SKIP][254] ([Intel XE#4141]) +11 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][255] -> [SKIP][256] ([Intel XE#7061]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][257] -> [SKIP][258] ([Intel XE#2352] / [Intel XE#7399])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][259] -> [SKIP][260] ([Intel XE#2313]) +44 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][261] -> [SKIP][262] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][263] -> [SKIP][264] ([Intel XE#6911] / [Intel XE#7378])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][265] -> [SKIP][266] ([Intel XE#7591])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][267] -> [SKIP][268] ([Intel XE#7283]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][269] -> [SKIP][270] ([Intel XE#2763] / [Intel XE#6886])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][271] -> [SKIP][272] ([Intel XE#8395] / [Intel XE#8396])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][273] -> [SKIP][274] ([Intel XE#2505] / [Intel XE#7447])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][275] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][276] ([Intel XE#8710])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][277] ([Intel XE#8710]) -> [SKIP][278] ([Intel XE#6814] / [Intel XE#7428])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#1489]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][281] -> [SKIP][282] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr@pr-sprite-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][283] -> [SKIP][284] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][285] -> [SKIP][286] ([Intel XE#2413])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][287] -> [SKIP][288] ([Intel XE#6503]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][289] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][290] ([Intel XE#2426] / [Intel XE#5848])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][291] -> [SKIP][292] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][293] -> [SKIP][294] ([Intel XE#6599])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#8370]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#8374]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#8364]) +22 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#8369]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@fault-process-same-page-benchmark:
    - shard-bmg:          [SKIP][305] -> [DMESG-WARN][306] ([Intel XE#9331]) +1 other test dmesg-warn
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:
    - shard-bmg:          [SKIP][307] -> [DMESG-WARN][308] ([Intel XE#9309])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][309] -> [SKIP][310] ([Intel XE#8378]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          [SKIP][311] -> [SKIP][312] ([Intel XE#7793]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_page_reclaim@binds-full-pd.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#2284] / [Intel XE#7370])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          [SKIP][315] -> [SKIP][316] ([Intel XE#8815])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#4733] / [Intel XE#7417])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#944]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][321] -> [DMESG-WARN][322] ([Intel XE#8963]) +1 other test dmesg-warn
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8329
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
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
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9241]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9241
  [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -> xe-pw-174474v4

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf
  xe-pw-174474v4: 174474v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/index.html

--===============6061118695117151971==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Disable DC5/6 before AUX programming (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174474/">https://patchwork.freedesktop.org/series/174474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf_FULL -&gt; xe-pw-174474v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174474v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174474v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174474v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-malloc-nomemset.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> +363 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-new-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@twice-large-new-race.html">DMESG-WARN</a> +28 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259">Intel XE#9259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@once-large-mmap-remap-ro.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@once-large-mmap-remap-ro.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_system_allocator@processes-evict-malloc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html">DMESG-WARN</a> +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-protection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_madvise@per-vma-protection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-3/igt@xe_madvise@per-vma-protection.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174474v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8329">Intel XE#8329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-remap-no-cpu-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-6/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind-with-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind-with-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9241">Intel XE#9241</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-1/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>{shard-ptl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +456 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-3/igt@xe_exec_system_allocator@once-mmap-file-mlock-nomemset.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>{shard-ptl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-ptl-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@srm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_feature_discovery@vrr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr@pr-sprite-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-same-page-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v4/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -&gt; xe-pw-174474v4</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf<br />
  xe-pw-174474v4: 174474v4</p>

</body>
</html>

--===============6061118695117151971==--
