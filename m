Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB421D6555B
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 21:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B0010E2DB;
	Tue, 26 Nov 2024 21:41:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F3C10E176;
 Tue, 26 Nov 2024 21:41:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3600040728470639789=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe/migrate=3A_fix_pat_index_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 21:41:55 -0000
Message-ID: <173265731558.3459849.14713571721948854563@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126181259.159713-3-matthew.auld@intel.com>
In-Reply-To: <20241126181259.159713-3-matthew.auld@intel.com>
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

--===============3600040728470639789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/migrate: fix pat index usage
URL   : https://patchwork.freedesktop.org/series/141805/
State : failure

== Summary ==

CI Bug Log - changes from xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198_full -> xe-pw-141805v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141805v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141805v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141805v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][5] ([Intel XE#2136]) -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-FAIL][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-bmg:          [SKIP][11] ([Intel XE#2423]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_getfb@getfb-repeated-different-handles.html

  
Known issues
------------

  Here are the changes found in xe-pw-141805v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2423]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_getclient.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@core_getclient.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#3086]) +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#1885])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1885])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#3249])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#3453])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#3453])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#3339])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
    - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#3339])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2134]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@fbdev@read.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2134]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@fbdev@unaligned-write.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2423]) +112 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#324])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2550]) +23 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#2136]) +19 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2136]) +22 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#3468])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +69 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2423] / [i915#2575]) +23 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2929]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-1/igt@kms_color@ctm-signed.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-3/igt@kms_color@ctm-signed.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2577]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][55] ([Intel XE#3468]) +22 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#2423] / [i915#2575]) +65 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][60] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][61] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][62] ([Intel XE#3468]) +2 other tests dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][63] ([Intel XE#1727] / [Intel XE#3468]) +8 other tests dmesg-fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886]) +4 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#2882])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#3486])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-suspend@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][70] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#1727] / [Intel XE#3468])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][73] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#455]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2136]) +27 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2380])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][80] -> [DMESG-FAIL][81] ([Intel XE#3468]) +3 other tests dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][82] ([Intel XE#3468]) +5 other tests dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][83] ([Intel XE#2705]) +2 other tests dmesg-fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#2351])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2311]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2136]) +17 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2313])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#3468])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#346])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#3468]) +15 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][95] ([Intel XE#1727]) +1 other test dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +15 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2446])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2446]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2446])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#3184]) +2 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2446]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][107] -> [DMESG-WARN][108] ([Intel XE#2042])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#3468]) +7 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_setmode@basic:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2423]) +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#899]) +2 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_create@create-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1130]) +44 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_create@create-invalid-size.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2905])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1130]) +22 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#1130]) +270 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3467])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][120] -> [SKIP][121] ([Intel XE#2229]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][122] ([Intel XE#2249])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][123] -> [INCOMPLETE][124] ([Intel XE#569])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s3-vm-bind-userptr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][125] ([Intel XE#1727] / [Intel XE#3468])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@xe_pm@s4-basic.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1130]) +142 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#3440]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@core_getversion@all-cards.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][130] ([Intel XE#1885]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][134] ([Intel XE#2134]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@fbdev@unaligned-read.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@fbdev@unaligned-read.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#2423]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_3d.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_3d.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][138] ([Intel XE#324]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#2136]) -> [PASS][141] +11 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][143] +7 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][144] ([Intel XE#2136]) -> [PASS][145] +13 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_draw_crc@draw-method-render@rgb565-4tiled:
    - shard-bmg:          [INCOMPLETE][146] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][148] ([Intel XE#3468]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled.html

  * igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled:
    - shard-bmg:          [DMESG-WARN][150] ([Intel XE#3468]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][152] ([Intel XE#886]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][154] ([Intel XE#2423]) -> [PASS][155] +96 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2423] / [i915#2575]) -> [PASS][157] +51 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pipe_crc_basic@bad-source.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][158] ([Intel XE#2029]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2446]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][162] ([Intel XE#2446]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#1727]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_sysfs_edid_timing.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1130]) -> [PASS][167] +91 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         [DMESG-WARN][170] ([Intel XE#3086]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][172] ([Intel XE#958]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][174] ([Intel XE#1130]) -> [PASS][175] +221 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][176] ([Intel XE#1885]) -> [DMESG-WARN][177] ([Intel XE#3468])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][178] ([Intel XE#2423]) -> [SKIP][179] ([Intel XE#2233])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][180] ([Intel XE#2423]) -> [SKIP][181] ([Intel XE#2370])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#3468]) -> [DMESG-FAIL][183] ([Intel XE#3468])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][184] ([Intel XE#2327]) -> [SKIP][185] ([Intel XE#2136]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][187] ([Intel XE#316])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][188] ([Intel XE#2136]) -> [DMESG-WARN][189] ([Intel XE#1727] / [Intel XE#3468])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-FAIL][190] ([Intel XE#3468]) -> [DMESG-WARN][191] ([Intel XE#3468])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][192] ([Intel XE#2136]) -> [SKIP][193] ([Intel XE#2327]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#316]) -> [SKIP][195] ([Intel XE#2136]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][196] ([Intel XE#3468]) -> [SKIP][197] ([Intel XE#2136]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#402]) -> [SKIP][199] ([Intel XE#2136])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2136]) -> [SKIP][201] ([Intel XE#316])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#829]) -> [SKIP][203] ([Intel XE#2136] / [Intel XE#2351])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2136]) -> [SKIP][205] ([Intel XE#1124]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][207] ([Intel XE#1124]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#610]) -> [SKIP][209] ([Intel XE#2136])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][210] ([Intel XE#2136]) -> [SKIP][211] ([Intel XE#829]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][212] ([Intel XE#2136]) -> [SKIP][213] ([Intel XE#1124]) +10 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1124]) -> [SKIP][215] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][216] ([Intel XE#1124]) -> [SKIP][217] ([Intel XE#2136]) +17 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1124]) -> [SKIP][219] ([Intel XE#2136]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][220] ([Intel XE#2328]) -> [SKIP][221] ([Intel XE#2136])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][222] ([Intel XE#2136]) -> [SKIP][223] ([Intel XE#607])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#607]) -> [SKIP][225] ([Intel XE#2136])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][226] ([Intel XE#2136]) -> [SKIP][227] ([Intel XE#610])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2423] / [i915#2575]) -> [SKIP][229] ([Intel XE#367]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][230] ([Intel XE#2423]) -> [SKIP][231] ([Intel XE#2314] / [Intel XE#2894])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2423] / [i915#2575]) -> [SKIP][233] ([Intel XE#2191])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][234] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][235] ([Intel XE#2423]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2191]) -> [SKIP][237] ([Intel XE#2423] / [i915#2575])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#367]) -> [SKIP][239] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][240] ([Intel XE#2423]) -> [SKIP][241] ([Intel XE#367]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][242] ([Intel XE#367]) -> [SKIP][243] ([Intel XE#2423]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][244] ([Intel XE#2887]) -> [SKIP][245] ([Intel XE#2136]) +21 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2907]) -> [SKIP][247] ([Intel XE#2136]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#829]) -> [SKIP][249] ([Intel XE#2136]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
    - shard-bmg:          [SKIP][250] ([Intel XE#2136]) -> [SKIP][251] ([Intel XE#3282])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2136]) -> [INCOMPLETE][253] ([Intel XE#3468])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][254] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][255] ([Intel XE#2136])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][256] ([Intel XE#2136]) -> [SKIP][257] ([Intel XE#2652] / [Intel XE#787])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][258] ([Intel XE#3432]) -> [SKIP][259] ([Intel XE#2136]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][260] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][261] ([Intel XE#2136])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2136]) -> [SKIP][263] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][266] ([Intel XE#2136]) -> [SKIP][267] ([Intel XE#2887]) +14 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][269] ([Intel XE#2136]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][270] ([Intel XE#2325]) -> [SKIP][271] ([Intel XE#2423]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#306]) -> [SKIP][273] ([Intel XE#2423] / [i915#2575])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2423] / [i915#2575]) -> [SKIP][275] ([Intel XE#306]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][276] ([Intel XE#2423]) -> [SKIP][277] ([Intel XE#2325])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#373]) -> [SKIP][279] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][280] ([Intel XE#2423]) -> [SKIP][281] ([Intel XE#2252]) +13 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][282] ([Intel XE#2252]) -> [SKIP][283] ([Intel XE#2423]) +13 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2423] / [i915#2575]) -> [SKIP][285] ([Intel XE#373]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][286] ([Intel XE#2423]) -> [SKIP][287] ([Intel XE#2341]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@atomic.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][288] ([Intel XE#1178]) -> [SKIP][289] ([Intel XE#2423] / [i915#2575])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][290] ([Intel XE#2390]) -> [SKIP][291] ([Intel XE#2423])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2423] / [i915#2575]) -> [SKIP][293] ([Intel XE#307])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [INCOMPLETE][294] ([Intel XE#2715] / [Intel XE#3468]) -> [SKIP][295] ([Intel XE#2423])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_content_protection@legacy.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][296] ([Intel XE#1178]) -> [SKIP][297] ([Intel XE#2423]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][298] ([Intel XE#1188]) -> [SKIP][299] ([Intel XE#2423] / [i915#2575])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_content_protection@uevent.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][300] ([Intel XE#1188]) -> [SKIP][301] ([Intel XE#2423])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@uevent.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#308]) -> [SKIP][303] ([Intel XE#2423] / [i915#2575])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#2320]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][306] ([Intel XE#2321]) -> [SKIP][307] ([Intel XE#2423]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][308] ([Intel XE#2320]) -> [SKIP][309] ([Intel XE#2423]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#455]) -> [SKIP][311] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2423] / [i915#2575]) -> [SKIP][313] ([Intel XE#455]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2423] / [i915#2575]) -> [SKIP][315] ([Intel XE#323])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][316] ([Intel XE#2286]) -> [SKIP][317] ([Intel XE#2423]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][318] ([Intel XE#2423]) -> [SKIP][319] ([Intel XE#2286])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#323]) -> [SKIP][321] ([Intel XE#2423] / [i915#2575])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][322] ([Intel XE#2291]) -> [DMESG-WARN][323] ([Intel XE#3468] / [Intel XE#877])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][324] ([Intel XE#2423]) -> [DMESG-WARN][325] ([Intel XE#877])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][326] ([Intel XE#2423]) -> [SKIP][327] ([Intel XE#2291])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][328] ([Intel XE#1508]) -> [SKIP][329] ([Intel XE#2136]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][330] ([Intel XE#2423]) -> [SKIP][331] ([Intel XE#2323])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][332] ([Intel XE#2136]) -> [SKIP][333] ([Intel XE#3070])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [SKIP][334] ([Intel XE#2136]) -> [INCOMPLETE][335] ([Intel XE#1727] / [Intel XE#3468])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [INCOMPLETE][336] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][337] ([Intel XE#3468])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_draw_crc@draw-method-render@rgb565-xtiled:
    - shard-bmg:          [DMESG-FAIL][338] -> [DMESG-FAIL][339] ([Intel XE#3468])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][340] ([Intel XE#2244]) -> [SKIP][341] ([Intel XE#2136]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][342] ([Intel XE#2136]) -> [SKIP][343] ([Intel XE#2244])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][344] ([Intel XE#1695]) -> [SKIP][345] ([Intel XE#2136])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][346] ([Intel XE#776]) -> [SKIP][347] ([Intel XE#2136])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][348] ([Intel XE#2373]) -> [SKIP][349] ([Intel XE#2423])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#703]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1138]) -> [SKIP][353] ([Intel XE#2423] / [i915#2575])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][354] ([Intel XE#1138]) -> [SKIP][355] ([Intel XE#2423])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][356] ([Intel XE#2375]) -> [SKIP][357] ([Intel XE#2423])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1135]) -> [SKIP][359] ([Intel XE#2423] / [i915#2575])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][360] ([Intel XE#2316]) -> [SKIP][361] ([Intel XE#2423])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [SKIP][363] ([Intel XE#2316]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][364] ([Intel XE#2316]) -> [DMESG-WARN][365] ([Intel XE#3468])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-WARN][366] ([Intel XE#3468]) -> [SKIP][367] ([Intel XE#2423])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][369] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][370] ([Intel XE#2423]) -> [DMESG-WARN][371] ([Intel XE#3468])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2136]) -> [SKIP][373] ([Intel XE#455]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][374] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][375] ([Intel XE#2136]) +5 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][377] ([Intel XE#455])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#455]) -> [SKIP][379] ([Intel XE#2136])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#2380])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][382] ([Intel XE#2136]) -> [SKIP][383] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#455]) -> [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-bmg:          [SKIP][386] ([Intel XE#2423]) -> [SKIP][387] ([Intel XE#540])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#540]) -> [SKIP][389] ([Intel XE#2423] / [i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][390] ([i915#5274]) -> [SKIP][391] ([Intel XE#2423] / [i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][392] ([Intel XE#2311]) -> [SKIP][393] ([Intel XE#2136]) +44 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#2312]) +9 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][396] ([Intel XE#2311]) -> [SKIP][397] ([Intel XE#2312]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2136]) -> [SKIP][399] ([Intel XE#651]) +8 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][401] ([Intel XE#651]) +8 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][402] ([Intel XE#2136]) -> [FAIL][403] ([Intel XE#2333]) +12 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][404] ([Intel XE#3468]) -> [SKIP][405] ([Intel XE#2136]) +5 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][406] ([Intel XE#2136]) -> [DMESG-FAIL][407] ([Intel XE#3468]) +1 other test dmesg-fail
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2136]) -> [ABORT][409] ([Intel XE#3468])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][410] ([Intel XE#2333]) -> [SKIP][411] ([Intel XE#2136]) +20 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][412] ([Intel XE#2333]) -> [SKIP][413] ([Intel XE#2312]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][414] ([Intel XE#2136]) -> [SKIP][415] ([Intel XE#2352])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#651]) -> [SKIP][417] ([Intel XE#2136]) +20 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][418] ([Intel XE#2312]) -> [SKIP][419] ([Intel XE#2311]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#651]) -> [SKIP][421] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][422] ([Intel XE#2136]) -> [SKIP][423] ([Intel XE#2311]) +31 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][424] ([Intel XE#2312]) -> [SKIP][425] ([Intel XE#2136]) +8 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][427] ([Intel XE#658])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#653]) -> [SKIP][429] ([Intel XE#2136]) +18 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][430] -> [SKIP][431] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][432] ([Intel XE#2313]) -> [SKIP][433] ([Intel XE#2136]) +45 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][434] ([Intel XE#2312]) -> [SKIP][435] ([Intel XE#2313]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#3189]) +17 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#2313]) +29 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][440] ([Intel XE#2352]) -> [SKIP][441] ([Intel XE#2136])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][442] ([Intel XE#2136]) -> [INCOMPLETE][443] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#653]) -> [SKIP][445] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][446] ([Intel XE#2313]) -> [SKIP][447] ([Intel XE#2312]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][449] ([Intel XE#653]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#2136]) -> [SKIP][451] ([Intel XE#653]) +10 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#687]) -> [SKIP][453] ([Intel XE#2423] / [i915#2575])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_getfb@getfb-repeated-different-handles.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][454] ([Intel XE#2340]) -> [SKIP][455] ([Intel XE#2423])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [FAIL][456] -> [SKIP][457] ([Intel XE#2423] / [i915#2575])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][458] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][459] ([Intel XE#2423])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-dg2-set2:     [DMESG-WARN][460] ([Intel XE#1727]) -> [SKIP][461] ([Intel XE#2423] / [i915#2575])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][462] ([Intel XE#2927]) -> [SKIP][463] ([Intel XE#2136])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#346]) -> [SKIP][465] ([Intel XE#2136])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          [SKIP][466] ([Intel XE#346]) -> [SKIP][467] ([Intel XE#2136])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][468] ([Intel XE#2136]) -> [SKIP][469] ([Intel XE#2927])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][470] ([Intel XE#2501]) -> [SKIP][471] ([Intel XE#2423])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#356]) -> [SKIP][473] ([Intel XE#2423] / [i915#2575])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][474] ([Intel XE#2486]) -> [SKIP][475] ([Intel XE#2423])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [INCOMPLETE][476] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468]) -> [SKIP][477] ([Intel XE#2423])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-bmg:          [DMESG-FAIL][478] ([Intel XE#3468]) -> [SKIP][479] ([Intel XE#2423]) +3 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-basic.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][480] ([Intel XE#2685] / [Intel XE#3307]) -> [SKIP][481] ([Intel XE#2423])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][482] ([Intel XE#2423]) -> [SKIP][483] ([Intel XE#3189]) +17 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][484] ([Intel XE#2763]) -> [SKIP][485] ([Intel XE#2423]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][487] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][488] ([Intel XE#2423]) -> [SKIP][489] ([Intel XE#2763]) +3 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2423] / [i915#2575]) -> [SKIP][491] ([Intel XE#2763] / [Intel XE#455])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#870])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][494] ([Intel XE#2938]) -> [SKIP][495] ([Intel XE#2136])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][496] ([Intel XE#2136]) -> [SKIP][497] ([Intel XE#870])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_backlight@fade.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][498] ([Intel XE#870]) -> [SKIP][499] ([Intel XE#2136])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][500] ([Intel XE#2136]) -> [SKIP][501] ([Intel XE#2391])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#1129]) -> [SKIP][503] ([Intel XE#2136])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][504] ([Intel XE#2136]) -> [SKIP][505] ([Intel XE#2392]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-bmg:          [DMESG-WARN][506] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][507] ([Intel XE#2136])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_dc@dc9-dpms.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#908]) -> [SKIP][509] ([Intel XE#2136])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          [SKIP][510] ([Intel XE#2505]) -> [SKIP][511] ([Intel XE#2136])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [FAIL][512] ([Intel XE#3527]) -> [SKIP][513] ([Intel XE#2136])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-bmg:          [SKIP][514] ([Intel XE#2499]) -> [SKIP][515] ([Intel XE#2136])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][516] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][517] ([Intel XE#2446])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][518] ([Intel XE#2446]) -> [SKIP][519] ([Intel XE#1439] / [Intel XE#3141])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][520] -> [SKIP][521] ([Intel XE#2446])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-bmg:          [SKIP][522] ([Intel XE#2446]) -> [SKIP][523] ([Intel XE#3189])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][524] ([Intel XE#2446]) -> [INCOMPLETE][525] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2446]) -> [DMESG-WARN][527] ([Intel XE#2042] / [Intel XE#3468])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][528] ([Intel XE#1489]) -> [SKIP][529] ([Intel XE#2136]) +11 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#2136]) -> [SKIP][531] ([Intel XE#1489]) +7 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#1489]) -> [SKIP][533] ([Intel XE#2136]) +4 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][534] ([Intel XE#2136]) -> [SKIP][535] ([Intel XE#1489]) +8 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][536] ([Intel XE#2387]) -> [SKIP][537] ([Intel XE#2136]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][538] ([Intel XE#2136]) -> [SKIP][539] ([Intel XE#2387])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1122]) -> [SKIP][541] ([Intel XE#2136])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][542] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][543] ([Intel XE#2136]) +22 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][545] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][547] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][548] ([Intel XE#2136]) -> [SKIP][549] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][550] -> [SKIP][551] ([Intel XE#2136]) +12 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][553] ([Intel XE#2136]) +6 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2136]) -> [SKIP][555] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-onoff.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][556] ([Intel XE#2234]) -> [SKIP][557] ([Intel XE#2136])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][558] ([Intel XE#2414]) -> [SKIP][559] ([Intel XE#2136])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][560] ([Intel XE#2423]) -> [SKIP][561] ([Intel XE#3414])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [SKIP][562] ([Intel XE#2423]) -> [DMESG-FAIL][563] ([Intel XE#3468])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][564] ([Intel XE#3414]) -> [SKIP][565] ([Intel XE#2423]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][566] ([Intel XE#2330]) -> [SKIP][567] ([Intel XE#2423])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][568] ([Intel XE#2423]) -> [SKIP][569] ([Intel XE#2330]) +1 other test skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#2423] / [i915#2575]) -> [SKIP][571] ([Intel XE#3414])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][572] ([Intel XE#2413]) -> [SKIP][573] ([Intel XE#2423])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][574] ([Intel XE#1435]) -> [SKIP][575] ([Intel XE#2423])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2423] / [i915#2575]) -> [FAIL][577] ([Intel XE#1729])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2423] / [i915#2575]) -> [SKIP][579] ([Intel XE#330])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy-hang:
    - shard-bmg:          [INCOMPLETE][580] ([Intel XE#1727]) -> [SKIP][581] ([Intel XE#2423])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vblank@query-busy-hang.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vblank@query-busy-hang.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][582] ([Intel XE#2423]) -> [SKIP][583] ([Intel XE#1499])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_vrr@flip-dpms.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][584] -> [SKIP][585] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_vrr@flipline.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][586] ([Intel XE#2168]) -> [SKIP][587] ([Intel XE#2423]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_vrr@lobf.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][588] ([Intel XE#1499]) -> [SKIP][589] ([Intel XE#2423])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vrr@max-min.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          [SKIP][590] ([Intel XE#756]) -> [SKIP][591] ([Intel XE#2423])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][592] ([Intel XE#2423]) -> [SKIP][593] ([Intel XE#756])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][594] ([Intel XE#2423]) -> [SKIP][595] ([Intel XE#1091] / [Intel XE#2849])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#1130]) -> [SKIP][597] ([Intel XE#1126])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#1126]) -> [SKIP][599] ([Intel XE#1130]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][600] ([Intel XE#2504]) -> [SKIP][601] ([Intel XE#1130])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][602] ([Intel XE#2905]) -> [SKIP][603] ([Intel XE#1130]) +16 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_eudebug@basic-vm-access-userptr.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#2905]) -> [SKIP][605] ([Intel XE#1130]) +9 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          [SKIP][606] ([Intel XE#1130]) -> [SKIP][607] ([Intel XE#2905]) +13 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_eudebug@vma-ufence.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1130]) -> [SKIP][609] ([Intel XE#2905]) +6 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][610] -> [SKIP][611] ([Intel XE#1130])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#1130]) -> [FAIL][613] ([Intel XE#1600])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][614] ([Intel XE#2364]) -> [SKIP][615] ([Intel XE#1130])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1130]) -> [INCOMPLETE][617] ([Intel XE#1473])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][618] ([Intel XE#1130]) -> [SKIP][619] ([Intel XE#2322]) +10 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][620] ([Intel XE#2322]) -> [SKIP][621] ([Intel XE#1130]) +14 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#1130]) -> [SKIP][623] ([Intel XE#288]) +13 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#288]) -> [SKIP][625] ([Intel XE#1130]) +26 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-bmg:          [DMESG-WARN][626] ([Intel XE#3468]) -> [SKIP][627] ([Intel XE#1130]) +6 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_exec_reset@cm-close-fd.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#1130]) -> [DMESG-WARN][629] ([Intel XE#3467]) +1 other test dmesg-warn
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#1130]) -> [DMESG-WARN][631] ([Intel XE#3343])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][632] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][633] ([Intel XE#1130])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
    - shard-dg2-set2:     [DMESG-WARN][634] ([Intel XE#3467]) -> [SKIP][635] ([Intel XE#1130]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [SKIP][636] ([Intel XE#1130]) -> [DMESG-WARN][637] ([Intel XE#3467] / [Intel XE#3468])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [SKIP][638] ([Intel XE#1130]) -> [DMESG-WARN][639] ([Intel XE#3343] / [Intel XE#3468])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [DMESG-WARN][640] ([Intel XE#3343]) -> [SKIP][641] ([Intel XE#1130])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-FAIL][642] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][643] ([Intel XE#1130])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [FAIL][644] ([Intel XE#3499]) -> [SKIP][645] ([Intel XE#1130])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [SKIP][646] ([Intel XE#1130]) -> [DMESG-WARN][647] ([Intel XE#3467]) +1 other test dmesg-warn
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [DMESG-FAIL][648] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][649] ([Intel XE#1130])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_intel_bb@add-remove-objects:
    - shard-bmg:          [SKIP][650] ([Intel XE#1130]) -> [DMESG-WARN][651] ([Intel XE#1727]) +1 other test dmesg-warn
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_intel_bb@add-remove-objects.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_intel_bb@add-remove-objects.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][652] ([Intel XE#1130]) -> [SKIP][653] ([Intel XE#2459] / [Intel XE#2596])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][654] -> [DMESG-WARN][655] ([Intel XE#3467] / [Intel XE#3468])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_module_load@many-reload.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][656] ([Intel XE#3546]) -> [DMESG-WARN][657] ([Intel XE#3467]) +1 other test dmesg-warn
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_module_load@reload.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-FAIL][658] ([Intel XE#3467]) -> [FAIL][659] ([Intel XE#3546])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@buffer-fill:
    - shard-bmg:          [SKIP][660] ([Intel XE#1130]) -> [DMESG-WARN][661] ([Intel XE#3468]) +4 other tests dmesg-warn
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@buffer-fill.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [FAIL][662] ([Intel XE#2249]) -> [SKIP][663] ([Intel XE#1130])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#1130]) -> [SKIP][665] ([Intel XE#3573]) +4 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_oa@non-sampling-read-error.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#3573]) -> [SKIP][667] ([Intel XE#1130]) +9 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][668] ([Intel XE#1130]) -> [SKIP][669] ([Intel XE#2248]) +1 other test skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][670] ([Intel XE#1130]) -> [SKIP][671] ([Intel XE#1337])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][673] ([Intel XE#1130])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          [SKIP][674] ([Intel XE#1420]) -> [SKIP][675] ([Intel XE#1130])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][676] ([Intel XE#1130]) -> [SKIP][677] ([Intel XE#2245])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pat@pat-index-xelp.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][678] ([Intel XE#1130]) -> [SKIP][679] ([Intel XE#2236])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][681] ([Intel XE#1130]) +1 other test skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mocs:
    - shard-dg2-set2:     [DMESG-WARN][682] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][683] ([Intel XE#1130])
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_pm@d3hot-mocs.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-bmg:          [DMESG-WARN][684] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][685] ([Intel XE#1130])
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@d3hot-multiple-execs.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][686] ([Intel XE#1130]) -> [SKIP][687] ([Intel XE#2284]) +2 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [SKIP][688] ([Intel XE#1130]) -> [DMESG-WARN][689] ([Intel XE#1616] / [Intel XE#3468])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][690] ([Intel XE#2284]) -> [SKIP][691] ([Intel XE#1130]) +2 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][692] ([Intel XE#1130]) -> [SKIP][693] ([Intel XE#2284] / [Intel XE#366])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][694] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [SKIP][695] ([Intel XE#1130])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s4-mocs.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][696] ([Intel XE#1130]) -> [SKIP][697] ([Intel XE#579])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][698] ([Intel XE#944]) -> [SKIP][699] ([Intel XE#1130]) +4 other tests skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          [SKIP][700] ([Intel XE#1130]) -> [SKIP][701] ([Intel XE#944]) +4 other tests skip
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_query@multigpu-query-engines.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][702] ([Intel XE#944]) -> [SKIP][703] ([Intel XE#1130]) +3 other tests skip
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@large-binds-4194304:
    - shard-dg2-set2:     [DMESG-WARN][704] ([Intel XE#1727]) -> [SKIP][705] ([Intel XE#1130])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-binds-4194304.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_vm@large-binds-4194304.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][706] ([Intel XE#2919]) -> [SKIP][707] ([Intel XE#1130])
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_wedged@basic-wedged.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][708] -> [SKIP][709] ([Intel XE#1130])
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][710] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][711] ([Intel XE#1130])
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-pw-141805v1

  IGT_8126: 8126
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
  xe-pw-141805v1: 141805v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/index.html

--===============3600040728470639789==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/migrate: fix pat index usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141805/">https://patchwork.freedesktop.org/series/141805/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198_full -&gt; xe-pw-141805v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141805v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141805v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141805v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-4.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb2101010-xtiled.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141805v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_getclient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-1/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-3/igt@kms_color@ctm-signed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +22 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_create@create-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +270 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +142 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@rgb565-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb8888-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@xrgb8888-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +96 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +91 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +221 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282">Intel XE#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vblank@query-busy-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vblank@query-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_exec_reset@cm-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@add-remove-objects:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_intel_bb@add-remove-objects.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_intel_bb@add-remove-objects.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_oa@buffer-fill.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-4194304:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-binds-4194304.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_vm@large-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141805v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -&gt; xe-pw-141805v1</li>
</ul>
<p>IGT_8126: 8126<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198<br />
  xe-pw-141805v1: 141805v1</p>

</body>
</html>

--===============3600040728470639789==--
