Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC49C54735
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 22:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160E10E111;
	Tue, 27 Aug 2024 22:08:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B25E10E111;
 Tue, 27 Aug 2024 22:08:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6603951599333361876=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Revert_=22drm/i915=3A?=
 =?utf-8?q?_Disable_DSB_in_Xe_KMD=22_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 22:08:28 -0000
Message-ID: <172479650849.808181.6218696380642920221@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708055630.4058818-1-animesh.manna@intel.com>
In-Reply-To: <20240708055630.4058818-1-animesh.manna@intel.com>
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

--===============6603951599333361876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Revert "drm/i915: Disable DSB in Xe KMD" (rev6)
URL   : https://patchwork.freedesktop.org/series/131488/
State : failure

== Summary ==

CI Bug Log - changes from xe-1836-27592570393fbdca50a8767bf7b53ff88147e701_full -> xe-pw-131488v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131488v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131488v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131488v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +12 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_color@ctm-max@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +42 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_color@ctm-max@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_color@ctm-max@pipe-a-edp-1.html

  * igt@kms_color@ctm-signed:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_color@ctm-signed.html

  * igt@kms_color@deep-color@pipe-c-edp-1-gamma:
    - shard-lnl:          [PASS][6] -> [DMESG-FAIL][7] +20 other tests dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_color@deep-color@pipe-c-edp-1-gamma.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_color@deep-color@pipe-c-edp-1-gamma.html

  * igt@kms_color@legacy-gamma:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] +2 other tests dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@kms_color@legacy-gamma.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@kms_color@legacy-gamma.html

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][10] -> [FAIL][11] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [PASS][12] -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [FAIL][14] ([Intel XE#1874]) -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         [WARN][16] ([Intel XE#2078]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
    - {shard-bmg}:        [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_flip@plain-flip-interruptible:
    - {shard-bmg}:        [PASS][20] -> [INCOMPLETE][21] +2 other tests incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-1/igt@kms_flip@plain-flip-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-7/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-3:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][22] +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-1/igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in xe-pw-131488v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][23] -> [DMESG-WARN][24] ([Intel XE#1033])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +13 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1135] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#310])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#2597])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#651]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#653]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#2622])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#324]) +7 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#324]) +2 other tests dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][56] -> [FAIL][57] ([Intel XE#1874]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2318]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#870])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1122] / [Intel XE#1201])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#929])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#327])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#771] / [Intel XE#899])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#899])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#899])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1050])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#1000])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#688])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#1392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#288])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@many-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2360])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][83] -> [SKIP][84] ([Intel XE#1192])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][85] -> [TIMEOUT][86] ([Intel XE#1961] / [Intel XE#2026])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@xe_module_load@many-reload.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1061] / [Intel XE#1201])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1607])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][90] -> [ABORT][91] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [PASS][92] -> [ABORT][93] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - {shard-bmg}:        [SKIP][94] ([Intel XE#1885]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][96] ([Intel XE#1033]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][98] ([Intel XE#1426]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][100] ([Intel XE#1426]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][102] ([Intel XE#1659]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_color@ctm-0-25@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_color@ctm-0-25@pipe-b-dp-4.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-b-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - {shard-bmg}:        [SKIP][106] -> [PASS][107] +21 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#877]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][110] ([Intel XE#877]) -> [PASS][111] +6 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#1195] / [Intel XE#2597]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - {shard-bmg}:        [INCOMPLETE][114] -> [PASS][115] +3 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [INCOMPLETE][118] ([Intel XE#2050]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][120] ([Intel XE#1503]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][122] ([Intel XE#1874]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][124] ([Intel XE#1430]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - {shard-bmg}:        [SKIP][126] ([Intel XE#2446]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][128] ([Intel XE#899]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][130] ([Intel XE#1473]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][132] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-7/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [DMESG-WARN][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#2105]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][138] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][140] ([Intel XE#958]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@compact-64k-pages:
    - {shard-bmg}:        [SKIP][142] ([Intel XE#1130]) -> [PASS][143] +33 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_vm@compact-64k-pages.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@xe_vm@compact-64k-pages.html

  * igt@xe_vm@munmap-style-unbind-userptr-either-side-partial:
    - {shard-bmg}:        [DMESG-FAIL][144] ([Intel XE#1760]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_vm@munmap-style-unbind-userptr-either-side-partial.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-either-side-partial.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][147] ([Intel XE#316]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#316]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1124]) -> [SKIP][151] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][152] ([Intel XE#1242]) -> [FAIL][153] ([Intel XE#1231])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][154] ([Intel XE#1231]) -> [FAIL][155] ([Intel XE#1242])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][157] ([Intel XE#1124]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#367]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#367]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][161] ([Intel XE#2191]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][163] ([Intel XE#367]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#787]) +55 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1252]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#1252])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#787]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][173] ([Intel XE#1252]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][175] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#314]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#314]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][179] ([Intel XE#306])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_chamelium_color@degamma.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][181] ([Intel XE#373]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#373]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#307]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#308]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#308])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#323]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#323])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][190] ([i915#3804]) -> [SKIP][191] ([Intel XE#1201] / [i915#3804])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#776]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#776])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][195] ([Intel XE#455]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#455]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#651]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#651]) +25 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][201] ([Intel XE#651]) +19 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][203] ([Intel XE#653]) +14 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][205] ([Intel XE#658])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#653]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#653]) +29 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#605]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#605])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#356]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#356])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#498]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2318]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][221] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][223] ([Intel XE#2318]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#908]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#908])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][227] ([Intel XE#1129])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1489]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][231] ([Intel XE#1489]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][233] ([Intel XE#1122])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#929]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][237] ([Intel XE#929]) +8 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr@psr2-basic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][239] ([Intel XE#327])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#327]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][243] ([Intel XE#2168])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_vrr@cmrr.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2168]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#2168])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_vrr@lobf.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#756]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1123]) -> [SKIP][251] ([Intel XE#1123] / [Intel XE#1201])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][253] ([Intel XE#1123])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][255] ([Intel XE#1126])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1126]) -> [SKIP][257] ([Intel XE#1126] / [Intel XE#1201])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][259] ([Intel XE#288]) +17 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_exec_fault_mode@many-basic-prefetch.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#288]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#512]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#512])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_mmap@small-bar.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2541]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#2541]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][267] ([Intel XE#2541]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_oa@polling-small-buf.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][269] ([Intel XE#1337])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][273] ([Intel XE#944])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#944]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#944]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2567]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2567
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1836-27592570393fbdca50a8767bf7b53ff88147e701 -> xe-pw-131488v6

  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1836-27592570393fbdca50a8767bf7b53ff88147e701: 27592570393fbdca50a8767bf7b53ff88147e701
  xe-pw-131488v6: 131488v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html

--===============6603951599333361876==
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
<tr><td><b>Series:</b></td><td>drm/xe: Revert &quot;drm/i915: Disable DSB in Xe KMD&quot; (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131488/">https://patchwork.freedesktop.org/series/131488/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1836-27592570393fbdca50a8767bf7b53ff88147e701_full -&gt; xe-pw-131488v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131488v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131488v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131488v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_color@ctm-max@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_color@ctm-max@pipe-a-edp-1.html">DMESG-WARN</a> +42 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_color@ctm-signed.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-edp-1-gamma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_color@deep-color@pipe-c-edp-1-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_color@deep-color@pipe-c-edp-1-gamma.html">DMESG-FAIL</a> +20 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@kms_color@legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@kms_color@legacy-gamma.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-1/igt@kms_flip@plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-7/igt@kms_flip@plain-flip-interruptible.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-1/igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131488v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_color@ctm-0-25@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-b-dp-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-7/igt@xe_evict@evict-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-2/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@compact-64k-pages:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_vm@compact-64k-pages.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@xe_vm@compact-64k-pages.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-either-side-partial:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-bmg-5/igt@xe_vm@munmap-style-unbind-userptr-either-side-partial.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-either-side-partial.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1836-27592570393fbdca50a8767bf7b53ff88147e701/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131488v6/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1836-27592570393fbdca50a8767bf7b53ff88147e701 -&gt; xe-pw-131488v6</li>
</ul>
<p>IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1836-27592570393fbdca50a8767bf7b53ff88147e701: 27592570393fbdca50a8767bf7b53ff88147e701<br />
  xe-pw-131488v6: 131488v6</p>

</body>
</html>

--===============6603951599333361876==--
