Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED30CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 21:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2FF10E2B5;
	Fri, 10 Oct 2025 21:55:47 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A07C10E28D;
 Fri, 10 Oct 2025 21:55:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3356577084342274102=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/evict=3A_drop_bogus?=
 =?utf-8?q?_assert?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 21:55:47 -0000
Message-ID: <176013334722.1538.8639860059953555521@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251010152457.177884-2-matthew.auld@intel.com>
In-Reply-To: <20251010152457.177884-2-matthew.auld@intel.com>
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

--===============3356577084342274102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/evict: drop bogus assert
URL   : https://patchwork.freedesktop.org/series/155752/
State : success

== Summary ==

CI Bug Log - changes from xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165_FULL -> xe-pw-155752v1_FULL
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

  Here are the changes found in xe-pw-155752v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#1124]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#367])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#787]) +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#6014] / [Intel XE#6168])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1727] / [Intel XE#3113]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#6168] / [i915#14968])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#3009])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_dp_aux_dev.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2316]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4543] / [Intel XE#5208])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4543]) +11 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#4543])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#653]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4596])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2571])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:
    - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#1489])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#1435])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4837]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4915]) +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#378])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#3573])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#4819]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-65536:
    - shard-dg2-set2:     [SKIP][47] ([i915#6077]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-65536.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_addfb_basic@bad-pitch-65536.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][49] ([Intel XE#3884]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#829]) -> [PASS][52] +6 other tests pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_color@ctm-signed:
    - shard-adlp:         [DMESG-WARN][53] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][54] +5 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_color@ctm-signed.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-4/igt@kms_color@ctm-signed.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][55] ([Intel XE#2291]) -> [PASS][56] +3 other tests pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][57] ([Intel XE#5354]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][59] ([Intel XE#4354]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][61] ([Intel XE#2316]) -> [PASS][62] +7 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][63] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][65] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][67] ([Intel XE#301]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#4543]) -> [PASS][70] +6 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][71] ([Intel XE#5416]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][73] ([Intel XE#4543]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][75] ([Intel XE#1874]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#783]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][79] ([Intel XE#1503]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_lease@lease-invalid-connector:
    - shard-dg2-set2:     [SKIP][81] -> [PASS][82] +15 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_lease@lease-invalid-connector.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_lease@lease-invalid-connector.html

  * igt@kms_prop_blob@invalid-get-prop:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#780]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_prop_blob@invalid-get-prop.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_prop_blob@invalid-get-prop.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110]) ([Intel XE#378]) -> ([PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-435/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-435/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-435/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-463/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-463/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-466/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-463/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-436/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-436/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#829]) -> [SKIP][138] ([Intel XE#316])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#829]) -> [SKIP][140] ([Intel XE#1124]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][141] -> [SKIP][142] ([Intel XE#367])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#829]) -> [SKIP][144] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][145] -> [SKIP][146] ([Intel XE#306])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_chamelium_color@degamma.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][147] ([Intel XE#1188]) -> [SKIP][148] ([Intel XE#2341])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_content_protection@uevent.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][149] -> [SKIP][150] ([Intel XE#455]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][151] -> [SKIP][152] ([Intel XE#308])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#4543]) -> [TIMEOUT][154] ([Intel XE#4543]) +1 other test timeout
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][156] ([Intel XE#4543])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#783]) -> [SKIP][158] ([Intel XE#651]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][159] ([Intel XE#2312]) -> [SKIP][160] ([Intel XE#5390]) +9 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][161] ([Intel XE#5390]) -> [SKIP][162] ([Intel XE#2312]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][163] ([Intel XE#2311]) -> [SKIP][164] ([Intel XE#2312]) +12 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][165] ([Intel XE#2312]) -> [SKIP][166] ([Intel XE#2311]) +13 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#2313]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][169] ([Intel XE#2313]) -> [SKIP][170] ([Intel XE#2312]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#783]) -> [SKIP][172] ([Intel XE#653]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#829]) -> [SKIP][174] ([Intel XE#5021])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][175] -> [SKIP][176] ([Intel XE#870])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1406]) -> [SKIP][178] ([Intel XE#1406] / [Intel XE#1489])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1406]) -> [SKIP][180] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_psr@psr-primary-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_psr@psr-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][181] ([Intel XE#2426]) -> [FAIL][182] ([Intel XE#1729])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#362]) -> [FAIL][184] ([Intel XE#1729])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][185] ([Intel XE#5530]) -> [ABORT][186] ([Intel XE#4917] / [Intel XE#5530])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165 -> xe-pw-155752v1

  IGT_8581: 8581
  xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165: a83c7590b57a56cfc1f4d9e1c07948643c9ed165
  xe-pw-155752v1: 155752v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/index.html

--===============3356577084342274102==
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
<tr><td><b>Series:</b></td><td>drm/xe/evict: drop bogus assert</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155752/">https://patchwork.freedesktop.org/series/155752/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155752v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155752v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3897-a83c7590b57a56cfc1f4d9e1c07948643=
c9ed165_FULL -&gt; xe-pw-155752v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155752v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6014">Intel XE#6014</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168=
">Intel XE#6168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14968">i915#14968</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_cursor_crc@cursor-slidi=
ng-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-1/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-6/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-3/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/=
shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scali=
ng@pipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_psr@psr2-sprite-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_exec_system_allocator@ma=
ny-large-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ad=
dfb_basic@bad-pitch-65536.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms=
_addfb_basic@bad-pitch-65536.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-=
4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-46=
4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +6 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_col=
or@ctm-signed.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-adlp-4/=
igt@kms_color@ctm-signed.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155752v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">In=
tel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155752v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-7/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155752v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
52v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55752v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_flip=
@plain-flip-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#5416</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/sh=
ard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155752v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
52v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-mov=
e.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-5/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_le=
ase@lease-invalid-connector.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_lease@lease=
-invalid-connector.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-get-prop:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_pr=
op_blob@invalid-get-prop.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_pr=
op_blob@invalid-get-prop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165=
/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c=
9ed165/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c079=
48643c9ed165/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d=
9e1c07948643c9ed165/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56c=
fc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b=
57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83=
c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-38=
97-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9e=
d165/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948=
643c9ed165/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1f4d9e1=
c07948643c9ed165/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a56cfc1=
f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c7590b57a=
56cfc1f4d9e1c07948643c9ed165/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-a83c75=
90b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3897-=
a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5752v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155752v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-434/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155752v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55752v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-155752v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155752v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/=
shard-dg2-466/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@xe_mod=
ule_load@reload-no-display.html">FAIL</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@xe_module_load@r=
eload-no-display.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_bi=
g_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@km=
s_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@=
kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt=
@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_chamelium_color@d=
egamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-32x32.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_cursor_crc=
@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-sliding-512x512.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_cursor_=
crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard=
-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155752v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard=
-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55752v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155752v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155752v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55752v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
52v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1557=
52v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_pm_backlig=
ht@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ps=
r2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1=
406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55752v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-466/igt@kms_ps=
r@psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-464/igt@kms_psr@=
psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1/shard-dg2-435/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165/shard-adlp-3/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155752v1=
/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165 -&gt; xe-pw-155=
752v1</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3897-a83c7590b57a56cfc1f4d9e1c07948643c9ed165: a83c7590b57a56cfc1f4d9e=
1c07948643c9ed165<br />
  xe-pw-155752v1: 155752v1</p>

</body>
</html>

--===============3356577084342274102==--
