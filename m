Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E183C282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 12:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B44010E403;
	Mon,  3 Mar 2025 12:35:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5127F10E403;
 Mon,  3 Mar 2025 12:35:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9202596188357564697=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_UAPI_support_for_low_l?=
 =?utf-8?q?atency_hint_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 12:35:29 -0000
Message-ID: <174100532931.128718.441493563307944369@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228070224.739295-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250228070224.739295-1-tejas.upadhyay@intel.com>
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

--===============9202596188357564697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add UAPI support for low latency hint (rev3)
URL   : https://patchwork.freedesktop.org/series/143257/
State : failure

== Summary ==

CI Bug Log - changes from xe-2742-60b234fe25a41a2678a21d545477e22e0550faba_full -> xe-pw-143257v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143257v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143257v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143257v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +81 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481.html

  * igt@xe_exec_balancer@many-virtual-userptr:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-3/igt@xe_exec_balancer@many-virtual-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-1/igt@xe_exec_balancer@many-virtual-userptr.html

  * igt@xe_exec_reset@close-fd:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-6/igt@xe_exec_reset@close-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-6/igt@xe_exec_reset@close-fd.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][11] ([Intel XE#664]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_async_flips@test-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][13] ([Intel XE#1407]) -> [SKIP][14] +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][15] ([Intel XE#1477]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][17] ([Intel XE#1428]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][19] ([Intel XE#1124]) -> [SKIP][20] +18 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][21] ([Intel XE#2191]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          [SKIP][23] ([Intel XE#1512]) -> [SKIP][24] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          [SKIP][25] ([Intel XE#367]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][27] ([Intel XE#2887]) -> [SKIP][28] +21 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][29] ([Intel XE#2669]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][31] ([Intel XE#3432]) -> [SKIP][32] +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][33] ([Intel XE#4417]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_cdclk@mode-transition.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][35] ([Intel XE#3278]) -> [SKIP][36] +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_content_protection@uevent.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][37] ([Intel XE#2321]) -> [SKIP][38] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][39] ([Intel XE#1424]) -> [SKIP][40] +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][41] ([Intel XE#309]) -> [SKIP][42] +10 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][43] ([Intel XE#323]) -> [SKIP][44] +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][45] ([Intel XE#4354]) -> [SKIP][46] +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          [SKIP][47] ([Intel XE#2244]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_dsc@dsc-with-formats.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          [SKIP][49] ([Intel XE#4422]) -> [SKIP][50] +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][51] ([Intel XE#1503]) -> [SKIP][52] +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][53] ([Intel XE#599]) -> [SKIP][54] +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][55] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][57] ([Intel XE#1127]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          [SKIP][59] ([Intel XE#2413] / [Intel XE#374]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][61] ([Intel XE#1499]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  
Known issues
------------

  Here are the changes found in xe-pw-143257v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-lnl:          [PASS][63] -> [SKIP][64] ([Intel XE#2134]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@fbdev@info.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@fbdev@info.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4330]) +1 other test dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2327]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1407])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1124]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1124])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2328])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#2191])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2314] / [Intel XE#2894])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#367])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2887]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2887])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#3432]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2669]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#787]) +109 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][82] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2325])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#306])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2252]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#373])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2390])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][88] ([Intel XE#1178]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#1178])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2320]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][91] ([Intel XE#4330]) +7 other tests dmesg-warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#309]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#455]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#455] / [i915#3804])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4422])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4422])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#776])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-lnl:          [PASS][100] -> [SKIP][101] ([Intel XE#776]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2375])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#310]) +10 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#2882]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][107] ([Intel XE#2049]) +1 other test incomplete
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1421])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#2955])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][111] ([Intel XE#4330]) +9 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#2882]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#886])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a2-dp2.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [PASS][114] -> [SKIP][115] ([Intel XE#2482]) +11 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip@flip-vs-rmfb.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][116] ([Intel XE#2955]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][117] ([Intel XE#2049] / [Intel XE#2597])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [PASS][118] -> [SKIP][119] ([Intel XE#1745]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1401]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2293]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][124] -> [DMESG-FAIL][125] ([Intel XE#4330])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2311]) +19 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4141]) +11 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#656]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2352])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2313]) +18 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [PASS][132] -> [SKIP][133] ([Intel XE#2548]) +43 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#656]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#3374] / [Intel XE#3544])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-lnl:          [PASS][136] -> [SKIP][137] ([Intel XE#2568]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_invalid_mode@bad-vsync-start.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          [PASS][138] -> [SKIP][139] ([Intel XE#4328])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4090])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][141] -> [SKIP][142] ([Intel XE#3380]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#616]) +2 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][144] ([Intel XE#2566] / [Intel XE#4212])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][145] -> [SKIP][146] ([Intel XE#2763]) +21 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2763]) +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#870]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [PASS][149] -> [SKIP][150] ([Intel XE#870]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [PASS][151] -> [DMESG-WARN][152] ([Intel XE#4330]) +6 other tests dmesg-warn
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][153] ([Intel XE#718])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [PASS][154] -> [SKIP][155] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][156] -> [SKIP][157] ([Intel XE#836])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_properties@invalid-properties-atomic:
    - shard-dg2-set2:     [PASS][159] -> [DMESG-WARN][160] ([Intel XE#4330]) +5 other tests dmesg-warn
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@kms_properties@invalid-properties-atomic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@kms_properties@invalid-properties-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [PASS][161] -> [SKIP][162] ([Intel XE#1489]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#1489]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1406])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][166] -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2414])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#3414] / [Intel XE#3904])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2330])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2168])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1499])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#756])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2504])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#3889])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2905]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#688])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][178] -> [SKIP][179] ([Intel XE#1392]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2322]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#288])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [PASS][182] -> [DMESG-WARN][183] ([Intel XE#4173]) +2 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#2229])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2541] / [Intel XE#3573])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2248])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2284])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          NOTRUN -> [ABORT][188] ([Intel XE#4268]) +2 other tests abort
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#579])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#944]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [INCOMPLETE][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@fbdev@write.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@fbdev@write.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#4330]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2191]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#309]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#702]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][201] ([Intel XE#301]) -> [PASS][202] +3 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2:
    - shard-bmg:          [FAIL][203] ([Intel XE#2882]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][205] ([Intel XE#2953]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][207] ([Intel XE#4173]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][209] ([Intel XE#4330]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][211] ([Intel XE#1874]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#656]) -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][215] ([Intel XE#4330]) -> [PASS][216] +18 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [INCOMPLETE][217] -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][219] ([Intel XE#899]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1392]) -> [PASS][222] +6 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][223], [PASS][224], [SKIP][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243]) ([Intel XE#2457]) -> ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [INCOMPLETE][264] -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_pm@s2idle-basic-exec.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - shard-bmg:          [DMESG-WARN][266] ([Intel XE#4330]) -> [PASS][267] +3 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][269] ([Intel XE#787]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#787]) -> [SKIP][271] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [DMESG-FAIL][272] ([Intel XE#4330]) -> [SKIP][273] ([Intel XE#455])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_content_protection@srm.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#310]) -> [DMESG-FAIL][275] ([Intel XE#4330])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][276] ([Intel XE#886]) -> [SKIP][277] ([Intel XE#2482])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][278] ([Intel XE#301]) -> [SKIP][279] ([Intel XE#2482])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][280] ([Intel XE#2955]) -> [INCOMPLETE][281] ([Intel XE#2049] / [Intel XE#2597])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][282] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][283] ([Intel XE#1745]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          [SKIP][284] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][285] ([Intel XE#1745]) +9 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][286] ([Intel XE#651]) -> [SKIP][287] ([Intel XE#2548]) +23 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#656]) -> [SKIP][289] ([Intel XE#651]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#651]) -> [SKIP][291] ([Intel XE#656]) +18 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#656]) -> [SKIP][293] ([Intel XE#653]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#653]) -> [SKIP][295] ([Intel XE#656]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][296] ([Intel XE#656]) -> [SKIP][297] ([Intel XE#2548]) +60 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][298] ([Intel XE#2566] / [Intel XE#4212]) -> [DMESG-WARN][299] ([Intel XE#2566] / [Intel XE#2705] / [Intel XE#4212])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][300] ([Intel XE#3325]) -> [SKIP][301] ([Intel XE#734])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][302] ([Intel XE#2893]) -> [SKIP][303] ([Intel XE#1489]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][304] ([Intel XE#1128]) -> [SKIP][305] ([Intel XE#1122]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          [SKIP][306] ([Intel XE#1406]) -> [SKIP][307] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2742-60b234fe25a41a2678a21d545477e22e0550faba -> xe-pw-143257v3

  IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2742-60b234fe25a41a2678a21d545477e22e0550faba: 60b234fe25a41a2678a21d545477e22e0550faba
  xe-pw-143257v3: 143257v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/index.html

--===============9202596188357564697==
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
<tr><td><b>Series:</b></td><td>Add UAPI support for low latency hint (rev3)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143257/">https://patchwork.freedesktop.org/series/143257/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143257v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143257v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2742-60b234fe25a41a2678a21d545477e22e0=
550faba_full -&gt; xe-pw-143257v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143257v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143257v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1432=
57v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_big_fb@x-t=
iled-addfb-size-overflow.html">SKIP</a> +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_cur=
sor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4=
/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-1.html">INCOMPLE=
TE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-comp=
fmt0-vram01-vram01-481x481:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@xe_ccs=
@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-v=
ram01-481x481.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_ccs@block-copy-uncompresse=
d-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481.html">INC=
OMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-3/igt@xe_exec=
_balancer@many-virtual-userptr.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-1/igt@xe_exec_balan=
cer@many-virtual-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-6/igt@xe_exec_=
reset@close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143257v3/shard-lnl-6/igt@xe_exec_reset@close-fd.html">D=
MESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_asyn=
c_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_as=
ync_flips@test-cursor-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_big_=
fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_=
big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl=
-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_b=
ig_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sh=
ard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sh=
ard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SK=
IP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_ccs@=
bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/=
igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> +21 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/i=
gt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard=
-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4417">Intel XE#4417</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_cdclk@mod=
e-transition.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/ig=
t@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/=
igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl=
-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-be=
fore-cursor-atomic-transitions-varying-size.html">SKIP</a> +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sh=
ard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_plane_lowre=
s@tiling-x.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shar=
d-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl=
-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_scal=
ing_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-l=
nl-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143257v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143257v3/shard-lnl-7/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-3/igt@=
kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE=
#4330</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +109 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Int=
el XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_cursor_edge_walk@128x128-=
right-edge@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +7 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@k=
ms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-433/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_=
flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-7/igt@kms_flip@2x-blocking-w=
f_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_flip@2x=
-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend=
-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +9 other t=
ests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ad-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip=
@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip@flip-vs-rmfb.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482"=
>Intel XE#2482</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2955">Intel XE#2955</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-l=
nl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">In=
tel XE#2548</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_inva=
lid_mode@bad-vsync-start.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_invalid_mode@bad=
-vsync-start.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sha=
rd-lnl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763">Intel XE#2763</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_pm_b=
acklight@fade-with-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_pm_backlight@f=
ade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@kms_pm_d=
c@dc5-dpms-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_pm_dc@dc5-dpms-negati=
ve.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">In=
tel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-3/igt@kms_pm_r=
pm@dpms-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@kms_pm_rpm@dp=
ms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@kms_pr=
operties@invalid-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@kms_prop=
erties@invalid-properties-atomic.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sha=
rd-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@kms_psr@fbc-pr-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_psr@=
psr2-sprite-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_psr@psr2-sprite-p=
lane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-in=
valid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/sh=
ard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_=
early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evi=
ct_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@xe_oa@invalid-oa-exponent.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_pm@s4-exec-after.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268=
">Intel XE#4268</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@fbdev@=
write.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143257v3/shard-dg2-436/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE=
#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143257v3/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b=
-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/s=
hard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_fe=
ature_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-432/igt@kms_=
feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard=
-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@kms_flip=
@flip-vs-blocking-wf-vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/i=
gt@kms_flip@flip-vs-blocking-wf-vblank@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-4/=
igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE=
#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143257v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1432=
57v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43257v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-434/igt@kms_pl=
ane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3257v3/shard-dg2-436/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-=
a-6.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/=
shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully=
-sf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-2/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl=
-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3257v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userp=
tr-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550=
faba/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e=
0550faba/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d545477=
e22e0550faba/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a21d54=
5477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a2678a2=
1d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a41a26=
78a21d545477e22e0550faba/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe25a4=
1a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b234fe=
25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-60b2=
34fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2742-=
60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143257v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143257v3/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-7/igt@xe_pm@s2=
idle-basic-exec.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-2/igt@xe_pm@s2idle-basic-exec=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-bmg-2/igt@xe_prime=
_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-bmg-=
7/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143257v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-=
ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143257v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_co=
ntent_protection@srm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-464/igt@km=
s_content_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_fl=
ip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-=
dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330=
">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_flip@bloc=
king-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-dg2-434/igt@kms_=
flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile=
-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">I=
ntel XE#1401</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143257v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3257v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143257v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1432=
57v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257=
v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2548">Intel XE#2548</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-dg2-432/igt@kms_pl=
ane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1432=
57v3/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566"=
>Intel XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-4/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143257v3/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2742-60b234fe25a41a2678a21d545477e22e0550faba/shard-lnl-5/igt@kms_psr@=
pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v3/shard-lnl-7/igt@kms_psr@pr=
-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests =
skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2742-60b234fe25a41a2678a21d545477e22e0550faba -&gt; xe-pw-143=
257v3</li>
</ul>
<p>IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2742-60b234fe25a41a2678a21d545477e22e0550faba: 60b234fe25a41a2678a21d5=
45477e22e0550faba<br />
  xe-pw-143257v3: 143257v3</p>

</body>
</html>

--===============9202596188357564697==--
