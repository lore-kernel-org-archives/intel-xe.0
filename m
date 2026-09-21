Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02489C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9199F10E096;
	Mon, 21 Sep 2026 09:47:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BBF10E029;
 Mon, 21 Sep 2026 09:47:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7010562217776432309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Limit_sg_segment?=
 =?utf-8?q?_size_to_PAGE=5FSIZE_on_Xen_PV_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 09:47:56 -0000
Message-ID: <178998407678.185576.6713809856683852020@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916173030.3223833-1-accek@invisiblethingslab.com>
In-Reply-To: <20260916173030.3223833-1-accek@invisiblethingslab.com>
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

--===============7010562217776432309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV (rev3)
URL   : https://patchwork.freedesktop.org/series/172525/
State : failure

== Summary ==

CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf_FULL -> xe-pw-172525v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172525v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172525v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172525v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +33 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +304 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +23 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_module_load@force-load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@force-load.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][8] ([Intel XE#2370]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][10] ([Intel XE#2327]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][12] ([Intel XE#1124]) -> [SKIP][13] +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][14] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][16] ([Intel XE#367]) -> [SKIP][17] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          [SKIP][18] ([Intel XE#7358]) -> [SKIP][19] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][20] ([Intel XE#2252]) -> [SKIP][21] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][22] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][24] ([Intel XE#2320]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][26] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][28] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][30] ([Intel XE#8265]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][32] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][34] ([Intel XE#4141]) -> [SKIP][35] +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][36] ([Intel XE#2311]) -> [SKIP][37] +32 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][38] ([Intel XE#7061]) -> [SKIP][39] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][40] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][41] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][42] ([Intel XE#2313]) -> [SKIP][43] +29 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [SKIP][44] ([Intel XE#9329]) -> [SKIP][45] +40 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          [SKIP][46] ([Intel XE#7283]) -> [SKIP][47] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][48] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][50] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][52] ([Intel XE#1489]) -> [SKIP][53] +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][54] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][56] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][57] +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr@psr-basic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][58] ([Intel XE#2234]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_psr@psr2-primary-render.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][60] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][62] ([Intel XE#6503]) -> [SKIP][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][64] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][66] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][67] +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][68] ([Intel XE#8374]) -> [SKIP][69] +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][70] ([Intel XE#8364]) -> [SKIP][71] +15 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][72] ([Intel XE#8369]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-stride-free:
    - shard-bmg:          [DMESG-WARN][74] -> [SKIP][75] +21 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-free.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-free.html

  * igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
    - shard-bmg:          [DMESG-WARN][76] ([Intel XE#9331]) -> [SKIP][77] +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:
    - shard-bmg:          [SKIP][78] -> [DMESG-WARN][79] +13 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][80] ([Intel XE#8378]) -> [SKIP][81] +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_madvise@per-vma-protection:
    - shard-bmg:          [DMESG-WARN][82] ([Intel XE#9331]) -> [DMESG-WARN][83] +8 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_madvise@per-vma-protection.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_madvise@per-vma-protection.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][84] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][86] ([Intel XE#7793]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [FAIL][88] ([Intel XE#7695]) -> [SKIP][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][90] ([Intel XE#7590]) -> [SKIP][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_pat@xa-app-transient-media-off.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][92] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][94] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][95] +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          [SKIP][96] ([Intel XE#944]) -> [SKIP][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_query@multigpu-query-oa-units.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_query@multigpu-query-oa-units.html

  
Known issues
------------

  Here are the changes found in xe-pw-172525v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose-with-load:
    - shard-bmg:          [PASS][98] -> [ABORT][99] ([Intel XE#8007])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@core_hotunplug@hotrebind-lateclose-with-load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose-with-load.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2134])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@fbdev@write.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2327]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1124]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1467] / [Intel XE#7367])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1124]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7679]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#367])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2887])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#3432])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2887]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2325] / [Intel XE#7358])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#7358])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7358])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2252]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#373]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6969]) +26 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][118] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +5 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1468] / [Intel XE#7396])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2320]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#309] / [Intel XE#7343])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2286] / [Intel XE#6035])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#8265]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#8265])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4422] / [Intel XE#7442])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1138] / [Intel XE#7344])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#7178] / [Intel XE#7351])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#7178] / [Intel XE#7351])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#7179]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#7061] / [Intel XE#7356])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#6312]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4141]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2311]) +41 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#7865]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#7061]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#7905]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2350] / [Intel XE#7503])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2313]) +29 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2486])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#7283])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#8396]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][149] ([Intel XE#8399])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#1489]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1406])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#3904] / [Intel XE#7342])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#6503])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#1499] / [Intel XE#9271]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][158] ([Intel XE#6321] / [Intel XE#8355])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#6540] / [Intel XE#688])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#7482]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1392]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#8374])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8374]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8364]) +14 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#8364]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][167] ([Intel XE#9130])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#8369])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][169] ([Intel XE#7098] / [Intel XE#8159])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@once-large-mmap-file-mlock:
    - shard-bmg:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#9331])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_system_allocator@once-large-mmap-file-mlock.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@once-large-new-bo-map:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][172] ([Intel XE#9331])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_system_allocator@once-large-new-bo-map.html

  * igt@xe_exec_system_allocator@twice-malloc-bo-unmap:
    - shard-bmg:          [PASS][173] -> [DMESG-FAIL][174] ([Intel XE#6652])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_system_allocator@twice-malloc-bo-unmap.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_system_allocator@twice-malloc-bo-unmap.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][175] -> [FAIL][176] ([Intel XE#9096] / [Intel XE#9297])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#8378])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][179] -> [SKIP][180] ([Intel XE#8589]) +47 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#9203])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206]) -> ([PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [SKIP][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232]) ([Intel XE#2457] / [Intel XE#7405])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-8/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-8/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-9/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-9/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#6964]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [PASS][234] -> [FAIL][235] ([Intel XE#7334])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_oa@buffer-size.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@oag-0-32m:
    - shard-bmg:          NOTRUN -> [FAIL][236] ([Intel XE#7334])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_oa@buffer-size@oag-0-32m.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#7793])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#7793])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#1420] / [Intel XE#7590])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#5694] / [Intel XE#7370])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#2284] / [Intel XE#7370])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#944])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#944])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#8339])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [ABORT][246] ([Intel XE#8007]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][248] ([Intel XE#2134]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@fbdev@read.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-bmg:          [INCOMPLETE][250] ([Intel XE#9259]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [INCOMPLETE][252] ([Intel XE#9241]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-bmg:          [SKIP][254] ([Intel XE#9329]) -> [PASS][255] +7 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_properties@crtc-properties-atomic.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][256] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [SKIP][258] -> [PASS][259] +196 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][260] ([Intel XE#8578]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [DMESG-WARN][262] ([Intel XE#9331]) -> [PASS][263] +6 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [DMESG-WARN][264] ([Intel XE#9309]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [DMESG-WARN][266] -> [PASS][267] +30 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - {shard-ptl}:        [WARN][268] -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-6/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-ptl-4/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][270] -> [SKIP][271] ([Intel XE#2327]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][272] ([Intel XE#2327]) -> [SKIP][273] ([Intel XE#8589])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][274] -> [SKIP][275] ([Intel XE#1124]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][276] ([Intel XE#1124]) -> [SKIP][277] ([Intel XE#8589])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][278] ([Intel XE#2887]) -> [SKIP][279] ([Intel XE#8589]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][280] ([Intel XE#2887]) -> [SKIP][281] ([Intel XE#9329]) +5 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][282] ([Intel XE#3432]) -> [SKIP][283] ([Intel XE#9329])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][284] ([Intel XE#9329]) -> [SKIP][285] ([Intel XE#3432])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][286] ([Intel XE#9329]) -> [SKIP][287] ([Intel XE#2887]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][288] ([Intel XE#2652]) -> [SKIP][289] ([Intel XE#9329]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][290] ([Intel XE#2252]) -> [SKIP][291] ([Intel XE#8589])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][292] -> [SKIP][293] ([Intel XE#2252]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][294] -> [SKIP][295] ([Intel XE#6507] / [Intel XE#7358])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          [SKIP][296] ([Intel XE#6507]) -> [SKIP][297] ([Intel XE#6507] / [Intel XE#7358])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-2/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][298] -> [SKIP][299] ([Intel XE#6974])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][300] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][301] ([Intel XE#8589])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][302] -> [SKIP][303] ([Intel XE#2320]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][304] -> [SKIP][305] ([Intel XE#2321] / [Intel XE#7355])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][306] -> [SKIP][307] ([Intel XE#2286] / [Intel XE#6035])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][308] ([Intel XE#8265]) -> [SKIP][309] ([Intel XE#8589])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][310] -> [SKIP][311] ([Intel XE#8265]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][312] ([Intel XE#9329]) -> [SKIP][313] ([Intel XE#8586])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][314] -> [SKIP][315] ([Intel XE#7178] / [Intel XE#7351])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][316] -> [SKIP][317] ([Intel XE#2311]) +19 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][318] -> [SKIP][319] ([Intel XE#7061]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][320] -> [SKIP][321] ([Intel XE#4141]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][322] ([Intel XE#2311]) -> [SKIP][323] ([Intel XE#8589]) +7 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][324] ([Intel XE#2313]) -> [SKIP][325] ([Intel XE#8589]) +6 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][326] -> [SKIP][327] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][328] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][329] ([Intel XE#8589])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][330] -> [SKIP][331] ([Intel XE#2313]) +15 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][332] ([Intel XE#3544]) -> [SKIP][333] ([Intel XE#3374] / [Intel XE#3544])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][334] -> [SKIP][335] ([Intel XE#7591])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][336] -> [SKIP][337] ([Intel XE#7283]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][338] -> [SKIP][339] ([Intel XE#2763] / [Intel XE#6886])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][340] ([Intel XE#9329]) -> [SKIP][341] ([Intel XE#2505] / [Intel XE#7447])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][342] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][343] ([Intel XE#8710]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][344] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][345] ([Intel XE#8710])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][346] ([Intel XE#8710]) -> [SKIP][347] ([Intel XE#6814] / [Intel XE#7428])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][348] -> [SKIP][349] ([Intel XE#1489]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][350] ([Intel XE#1489]) -> [SKIP][351] ([Intel XE#8589])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][352] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][353] ([Intel XE#8589]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][354] -> [SKIP][355] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr@pr-sprite-render.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][356] ([Intel XE#9329]) -> [SKIP][357] ([Intel XE#3904] / [Intel XE#7342])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][358] -> [SKIP][359] ([Intel XE#2413])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][360] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][361] ([Intel XE#2426] / [Intel XE#5848])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][362] -> [SKIP][363] ([Intel XE#1499] / [Intel XE#9271])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-bmg:          [SKIP][364] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][365] ([Intel XE#8589])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][366] -> [SKIP][367] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][368] ([Intel XE#8374]) -> [SKIP][369] ([Intel XE#8589])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-prefetch.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
    - shard-bmg:          [DMESG-WARN][370] ([Intel XE#9331]) -> [SKIP][371] ([Intel XE#8589])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          [SKIP][372] -> [SKIP][373] ([Intel XE#8374]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][374] -> [SKIP][375] ([Intel XE#8364]) +8 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][376] -> [SKIP][377] ([Intel XE#8369]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][378] ([Intel XE#8369]) -> [SKIP][379] ([Intel XE#8589]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@fault-process-same-page-benchmark:
    - shard-bmg:          [SKIP][380] -> [DMESG-WARN][381] ([Intel XE#9331])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:
    - shard-bmg:          [DMESG-WARN][382] -> [SKIP][383] ([Intel XE#8589]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][384] ([Intel XE#8378]) -> [SKIP][385] ([Intel XE#8589])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          [SKIP][386] -> [SKIP][387] ([Intel XE#8378]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-rebind.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [SKIP][388] -> [INCOMPLETE][389] ([Intel XE#9270])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][390] -> [SKIP][391] ([Intel XE#7793])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][392] ([Intel XE#7695]) -> [SKIP][393] ([Intel XE#8589])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_pat@pat-sw-hw-reset-compare.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          [SKIP][394] -> [SKIP][395] ([Intel XE#8815])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][396] -> [SKIP][397] ([Intel XE#944]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [SKIP][398] -> [DMESG-WARN][399] ([Intel XE#8963])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_wedged@basic-wedged.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9241]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9241
  [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
  [Intel XE#9270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9270
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -> xe-pw-172525v3

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf
  xe-pw-172525v3: 172525v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/index.html

--===============7010562217776432309==
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
<tr><td><b>Series:</b></td><td>drm/xe: Limit sg segment size to PAGE_SIZE o=
n Xen PV (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172525/">https://patchwork.freedesktop.org/series/172525/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-172525v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172525v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db=
9b74caf_FULL -&gt; xe-pw-172525v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172525v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-172525v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1725=
25v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/=
igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">DMESG-WA=
RN</a> +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/ig=
t@xe_exec_system_allocator@threads-many-execqueues-mmap.html">SKIP</a> +304=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-new-race.html">DMESG-WARN</a> +23 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_modul=
e_load@force-load.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@force-load.h=
tml">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172525v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_big_=
fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms=
_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172=
525v3/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_bw@l=
inear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cham=
elium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/s=
hard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">=
SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/=
shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7=
/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178"=
>Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
25v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-i=
ndfb-pgflip-blt.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/s=
hard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">=
SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel =
XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-r=
ender.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-=
indfb-draw-render.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pipe=
_crc_basic@nonblocking-crc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_=
pipe_crc_basic@nonblocking-crc.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_plan=
e@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</=
a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg=
-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel X=
E#7760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr2=
_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/ig=
t@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/ig=
t@kms_psr2_su@page_flip-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr=
@psr-basic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@kms_psr@psr=
2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
2525v3/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_shar=
pness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172525v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2=
322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
72">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueue=
s-many-vm-null-defer-bind.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
25v3/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate=
-race.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
25v3/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-prio=
rity.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_=
reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_=
system_allocator@many-stride-free.html">DMESG-WARN</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_ex=
ec_system_allocator@many-stride-free.html">SKIP</a> +21 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_exec_=
system_allocator@once-mmap-new-huge-nomemset.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
25v3/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.h=
tml">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
system_allocator@twice-mmap-remap-ro-dontunmap.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/ig=
t@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html">DMESG-WARN</=
a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_=
threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel X=
E#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userpt=
r-invalidate-race.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-protection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_madvi=
se@per-vma-protection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_=
madvise@per-vma-protection.html">DMESG-WARN</a> +8 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_page_=
reclaim@invalid-1g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_page_recl=
aim@invalid-1g.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pat@p=
at-sw-hw-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pat@pat-sw-=
hw-compare.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_pa=
t@xa-app-transient-media-off.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/i=
gt@xe_pm@d3cold-multiple-execs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_pxp@p=
xp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_query=
@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_query=
@multigpu-query-oa-units.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172525v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose-with-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@core_hot=
unplug@hotrebind-lateclose-with-load.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@core_hot=
unplug@hotrebind-lateclose-with-load.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@fbdev@wr=
ite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-172525v3/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_chamelium_color_pipeline@=
plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_chamelium_color_pipeline=
@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_color_pipeline@plane-lut1=
d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +26 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_color_pipeline@plane-lut=
3d-green-only@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_content_protection@atomi=
c-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +5 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cur=
sor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_dsc@dsc-basic-bigjoiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12=
-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
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
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
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
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +41 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_panel_fitting@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_plane_scaling@plane-scale=
r-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel =
XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
6">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@pr=
-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@ps=
r2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">=
Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_psr@fbc-psr-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_rotation_crc@bad-tiling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@kms_sharpness_filter@filter-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9271">Intel XE#9271</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-th=
reads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_evict@evict-threads-small-=
multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-p=
arallel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_basic@multigpu-once-=
basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-fault-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_reset@multi-queue-can=
cel-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_system_allocator@man=
y-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@xe_exec_=
system_allocator@once-large-mmap-file-mlock.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-8/igt@x=
e_exec_system_allocator@once-large-mmap-file-mlock.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE=
#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new-bo-map:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_exec_system_allocator@once=
-large-new-bo-map.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
system_allocator@twice-malloc-bo-unmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exe=
c_system_allocator@twice-malloc-bo-unmap.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-4/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-8/i=
gt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel =
XE#9096</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9297">Intel XE#9297</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_exec_threads@threads-multi=
-queue-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-fd-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8589">Intel XE#8589</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_mempage_offline@inject-dup=
licate-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b7=
4caf/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44d=
b9b74caf/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe6=
6c44db9b74caf/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d=
849fe66c44db9b74caf/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d=
5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9=
ae6d5d2d849fe66c44db9b74caf/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e78=
98b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7b7c7=
3e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5791-7=
b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-57=
91-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
172525v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172525v3/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172525v3/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172525v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migrati=
on-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-2/igt@xe_oa@bu=
ffer-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_oa@buffer-size.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel X=
E#7334</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@oag-0-32m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-3/igt@xe_oa@buffer-size@oag-0-32m.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7334">Intel XE#7334</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_page_reclaim@binds-null-vm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_page_reclaim@boundary-spl=
it.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-lnl-6/igt@xe_sriov_scheduling@equal-thr=
oughput-normal-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@core_hot=
unplug@hotrebind-lateclose.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@cor=
e_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@fbdev@re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@fbdev@read.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9259">Intel XE#9259</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10=
/igt@kms_frontbuffer_tracking@hdr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@kms_pm_r=
pm@system-suspend-modeset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9241">Intel XE#9241</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/i=
gt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_prop=
erties@crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@k=
ms_properties@crtc-properties-atomic.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-3/igt@kms_vrr@=
flipline@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-ptl-6=
/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_drm_f=
dinfo@utilization-single-full-load-isolation.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/ig=
t@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> +196 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-6/igt@xe_exec_=
fault_mode@atomic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-10/igt@xe_exec=
_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9331">Intel XE#9331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-172525v3/shard-bmg-1/igt@xe_exec_fault_mode@many-ex=
ecqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +6 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-4/igt@xe_exec_=
system_allocator@processes-evict-malloc.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/s=
hard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-many-large-mmap-remap-dontunmap-eocheck.html">DMES=
G-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172525v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-=
remap-dontunmap-eocheck.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-ptl-6/igt@xe_sriov=
_scheduling@equal-throughput-normal-priority.html">WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-ptl-4/ig=
t@xe_sriov_scheduling@equal-throughput-normal-priority.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_=
fb@4-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_big_fb@4-tile=
d-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms=
_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-=
bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel =
XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@=
ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bm=
g-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9=
329</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bm=
g-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9=
329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/s=
hard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE=
#9329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_chameliu=
m_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_chame=
lium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a=
>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-lnl-5/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-lnl-2=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">In=
tel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_c=
ontent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_curs=
or_crc@cursor-onscreen-256x85.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_cursor_crc@=
cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_curs=
or_crc@cursor-rapid-movement-512x512.html">SKIP</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_curs=
or_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sh=
ard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_dsc@=
dsc-with-bpc-bigjoiner.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_feat=
ure_discovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_feature_d=
iscovery@vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bm=
g-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">In=
tel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_frontb=
uffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-s=
hrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8589">Intel XE#8589</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">=
Intel XE#8589</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#=
7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel =
XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172525v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-=
5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plan=
e@pixel-format-y-tiled-modifier.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_plane@pix=
el-format-y-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sh=
ard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor=
-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9329">Intel XE#9329</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2505">Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-3/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172=
525v3/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-8/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525=
v3/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms=
_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v=
3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@kms_psr@=
fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_psr@=
pr-sprite-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9329">Intel XE#9329</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-b=
mg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE=
#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@kms_scaling_mod=
es@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel =
XE#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172525v3/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@kms_vrr@seamless-rr-sw=
itch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/sh=
ard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_e=
xec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel =
XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-ra=
ce-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8374">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues=
-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
fault_mode@twice-bindexecqueue-imm.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-=
bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
fault_mode@twice-multi-queue.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_fault_mo=
de@twice-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidat=
e:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3=
/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr=
-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
reset@cm-multi-queue-cat-error.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_exec_reset@=
cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
reset@multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_=
exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-same-page-benchmark:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
system_allocator@fault-process-same-page-benchmark.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-=
6/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-large-mmap-free-huge.html">DMESG-WARN</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shar=
d-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-free-huge.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Inte=
l XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-172525v3/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-rebind.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_exec_th=
reads@threads-multi-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_gt_fr=
eq@freq_suspend.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172525v3/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9270">Intel XE#9270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_page_=
reclaim@basic-mixed.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_page_reclaim@basic-mix=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-5/igt@xe_pat@p=
at-sw-hw-reset-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_pat@p=
at-sw-hw-reset-compare.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_prefe=
tch_fault@l2-prefetch-fault-svm.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_prefetch_f=
ault@l2-prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_query@mu=
ltigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf/shard-bmg-7/igt@xe_wedge=
d@basic-wedged.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-172525v3/shard-bmg-5/igt@xe_wedged@basic-wedged.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf -&gt; xe-pw-172=
525v3</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d84=
9fe66c44db9b74caf<br />
  xe-pw-172525v3: 172525v3</p>

</body>
</html>

--===============7010562217776432309==--
