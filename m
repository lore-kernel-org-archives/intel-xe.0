Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8585AC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 14:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298C10E400;
	Tue, 20 Aug 2024 14:16:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3F310E400;
 Tue, 20 Aug 2024 14:16:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8876856704892230673=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_series_starting_with_=5B1/3=5D_?=
 =?utf-8?q?drm/xe=3A_Remove_extra_dma=5Ffence=5Fput_on_xe=5Fsync=5Fentry=5Fa?=
 =?utf-8?q?dd=5Fdeps_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 14:16:52 -0000
Message-ID: <172416341236.699996.16672160701609746357@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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

--===============8876856704892230673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure
URL   : https://patchwork.freedesktop.org/series/137501/
State : success

== Summary ==

CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e_full -> xe-pw-137501v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137501v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - {shard-bmg}:        [PASS][1] -> [INCOMPLETE][2] +5 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - {shard-bmg}:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  
Known issues
------------

  Here are the changes found in xe-pw-137501v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#827])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1659])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#607]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#1204]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1874]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1231]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1399])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-adlp:         [PASS][27] -> [SKIP][28] ([Intel XE#1201]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#309])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#323])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#877]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_cursor_legacy@torture-move.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#1901])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#1901] / [Intel XE#2028]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195] / [Intel XE#2049])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1195])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][44] -> [DMESG-FAIL][45] ([Intel XE#324]) +5 other tests dmesg-fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#1874]) +9 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1861]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1151] / [Intel XE#1201])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#656]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#2028] / [Intel XE#2533]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][56] -> [DMESG-FAIL][57] ([Intel XE#324]) +1 other test dmesg-fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:
    - shard-lnl:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#324])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2318]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [PASS][66] -> [SKIP][67] ([Intel XE#870]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_pm_backlight@fade-with-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#1430])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#718])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1195])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_properties@crtc-properties-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#327])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#2443]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_vrr@flip-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#2028]) +5 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][83] -> [TIMEOUT][84] ([Intel XE#1473]) +1 other test timeout
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#1727] / [Intel XE#2226])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#2249]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#977])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#2284])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][99] -> [DMESG-WARN][100] ([Intel XE#1551] / [Intel XE#569])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][101] -> [ABORT][102] ([Intel XE#1358] / [Intel XE#1607])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@xe_pm@s4-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][103] -> [ABORT][104] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][105] -> [DMESG-WARN][106] ([Intel XE#2019])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][107] -> [FAIL][108] ([Intel XE#1081])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@large-userptr-binds-2147483648:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#2226]) +7 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_vm@large-userptr-binds-2147483648.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_vm@large-userptr-binds-2147483648.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-lnl:          [FAIL][111] ([Intel XE#2452]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@core_getversion@all-cards.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@core_getversion@all-cards.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][113] ([Intel XE#1426]) -> [PASS][114] +3 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][115] ([Intel XE#1426]) -> [PASS][116] +3 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][117] ([Intel XE#1659]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][119] ([Intel XE#2351]) -> [PASS][120] +8 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][121] ([Intel XE#324]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@basic-force-joiner@single:
    - {shard-bmg}:        [INCOMPLETE][123] -> [PASS][124] +3 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-1/igt@kms_big_joiner@basic-force-joiner@single.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-2/igt@kms_big_joiner@basic-force-joiner@single.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][125] ([Intel XE#2436]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][127] ([Intel XE#1541]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@busy-flip:
    - shard-lnl:          [SKIP][129] ([Intel XE#2423]) -> [PASS][130] +11 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@busy-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][131] ([Intel XE#886]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][133] ([Intel XE#1861]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [FAIL][135] ([Intel XE#2028]) -> [PASS][136] +7 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1162]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][139] ([Intel XE#324]) -> [PASS][140] +6 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][141] ([Intel XE#1874]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - {shard-bmg}:        [DMESG-WARN][143] ([Intel XE#877]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][145] ([Intel XE#361]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][147] ([Intel XE#718]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [SKIP][149] ([Intel XE#1201]) -> [PASS][150] +4 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pm_rpm@i2c.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [SKIP][151] ([Intel XE#2446]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][153] ([Intel XE#899]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][155] ([Intel XE#899]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][157] ([Intel XE#1551]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][159] ([Intel XE#2443]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_vrr@max-min.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][161] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][163] ([Intel XE#1473]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-3/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][165] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][167] ([Intel XE#1473]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-threads-large.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
    - shard-adlp:         [FAIL][169] ([Intel XE#1069]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-lnl:          [DMESG-WARN][171] ([Intel XE#1638]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_exec_basic@many-basic-defer-bind.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         [TIMEOUT][173] ([Intel XE#2582]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][175] ([Intel XE#2125]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][177] ([Intel XE#2105]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_store@basic-all:
    - shard-lnl:          [SKIP][179] ([Intel XE#1130]) -> [PASS][180] +27 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_exec_store@basic-all.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_exec_store@basic-all.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-lnl:          [FAIL][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_exec_threads@threads-rebind:
    - shard-adlp:         [INCOMPLETE][183] ([Intel XE#1169] / [Intel XE#1195]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_threads@threads-rebind.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_exec_threads@threads-rebind.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [INCOMPLETE][185] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][187] ([Intel XE#2019]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_module_load@reload.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][189] ([Intel XE#2514]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - {shard-bmg}:        [FAIL][191] ([Intel XE#2514]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][193] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [ABORT][195] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][197] ([Intel XE#1794]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][199] ([Intel XE#958]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#2226]) -> [PASS][202] +10 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_prime_self_import@basic-with_one_bo.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#801]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#316]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#316])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][208] ([Intel XE#316]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          [SKIP][209] ([Intel XE#2351]) -> [SKIP][210] ([Intel XE#1407])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#607]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#607])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1124]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][217] ([Intel XE#2351]) -> [SKIP][218] ([Intel XE#1124]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][220] ([Intel XE#610])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#367]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][224] ([Intel XE#2191]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][226] ([Intel XE#367]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         [SKIP][227] ([Intel XE#1201]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#367])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1252]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#1252])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][232] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][233] ([Intel XE#2351]) -> [SKIP][234] ([Intel XE#1399]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-adlp:         [SKIP][237] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][238] ([Intel XE#1201]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][240] ([Intel XE#787]) +69 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#787]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][243] ([Intel XE#1201]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][245] ([Intel XE#2351]) -> [SKIP][246] ([Intel XE#314])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][248] ([Intel XE#306]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#306]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#306])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          [SKIP][251] ([Intel XE#2423]) -> [SKIP][252] ([Intel XE#373]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#373]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][256] ([Intel XE#373]) +6 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][257] ([Intel XE#2423]) -> [SKIP][258] ([Intel XE#1413])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][260] ([Intel XE#308]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          [SKIP][261] ([Intel XE#2423]) -> [SKIP][262] ([Intel XE#1424])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#323]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#323])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][266] ([Intel XE#776])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#703]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#703])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1137]) -> [SKIP][270] ([Intel XE#1137] / [Intel XE#1201])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][272] ([Intel XE#1135])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1135]) -> [SKIP][274] ([Intel XE#1135] / [Intel XE#1201])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          [SKIP][275] ([Intel XE#2423]) -> [SKIP][276] ([Intel XE#1421]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][277] ([Intel XE#1551]) -> [INCOMPLETE][278] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) +1 other test incomplete
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][280] ([Intel XE#455]) +11 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][281] ([Intel XE#2351]) -> [SKIP][282] ([Intel XE#651]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][285] ([Intel XE#2351]) -> [SKIP][286] ([Intel XE#656]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][288] ([Intel XE#651]) +23 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][289] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][290] ([Intel XE#1201])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#651]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#651]) +23 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         [FAIL][293] -> [SKIP][294] ([Intel XE#1201] / [Intel XE#651])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#653]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#653]) +24 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][297] ([Intel XE#1201]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][300] ([Intel XE#1158])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][301] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][302] ([Intel XE#1201])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][303] ([Intel XE#1201]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][306] ([Intel XE#653]) +25 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          [SKIP][307] ([Intel XE#2423]) -> [SKIP][308] ([Intel XE#1470])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#455]) -> [SKIP][310] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][311] ([Intel XE#1450] / [Intel XE#599]) -> [SKIP][312] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#356]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#356])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [SKIP][315] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-lnl:          [SKIP][317] ([Intel XE#2423]) -> [SKIP][318] ([Intel XE#2318])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2318]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][323] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][326] ([Intel XE#2318]) +2 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][328] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#870]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#870])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][332] ([Intel XE#1129])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][334] ([Intel XE#908])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1489]) -> [SKIP][336] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][338] ([Intel XE#1489]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][340] ([Intel XE#1122])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1122]) -> [SKIP][342] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          [SKIP][343] ([Intel XE#2351]) -> [SKIP][344] ([Intel XE#1406])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_psr@pr-primary-render.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#929]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][348] ([Intel XE#929]) +10 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_psr@psr2-sprite-plane-move.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][350] ([Intel XE#327]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#327]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#327])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         [SKIP][353] ([Intel XE#1201]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#756]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#756])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][360] ([Intel XE#1123]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][361] ([Intel XE#1473]) -> [TIMEOUT][362] ([Intel XE#1041] / [Intel XE#1473])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][363] ([Intel XE#1473]) -> [TIMEOUT][364] ([Intel XE#1041] / [Intel XE#1473]) +1 other test timeout
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][365] ([Intel XE#1473]) -> [INCOMPLETE][366] ([Intel XE#1195] / [Intel XE#1473])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][368] ([Intel XE#288]) +18 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#288]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][372] ([Intel XE#255])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][373] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455]) -> [SKIP][374] ([Intel XE#1192] / [Intel XE#1201])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][376] ([Intel XE#560])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][378] ([Intel XE#2541]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2541]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#979]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#979])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][384] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_pm@d3cold-basic.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          [SKIP][385] ([Intel XE#1130]) -> [SKIP][386] ([Intel XE#944])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][388] ([Intel XE#944]) +3 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_query@multigpu-query-topology.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#944]) -> [SKIP][390] ([Intel XE#1201] / [Intel XE#944])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2576
  [Intel XE#2582]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2582
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7976 -> IGT_7978
  * Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -> xe-pw-137501v1

  IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7bb6237a94ee46cc76e
  xe-pw-137501v1: 137501v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/index.html

--===============8876856704892230673==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137501/">https://patchwork.freedesktop.org/series/137501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e_full -&gt; xe-pw-137501v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137501v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137501v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533">Intel XE#2533</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_properties@crtc-properties-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-7/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_vm@large-userptr-binds-2147483648.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_vm@large-userptr-binds-2147483648.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452">Intel XE#2452</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner@single:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-1/igt@kms_big_joiner@basic-force-joiner@single.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-2/igt@kms_big_joiner@basic-force-joiner@single.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_flip@busy-flip.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_pm_rpm@i2c.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-3/igt@xe_evict@evict-cm-threads-large.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_exec_basic@many-basic-defer-bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2582">Intel XE#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125">Intel XE#2125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_exec_store@basic-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_exec_store@basic-all.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_threads@threads-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-2/igt@xe_exec_threads@threads-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_module_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_prime_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-5/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-adlp-8/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137501v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7976 -&gt; IGT_7978</li>
<li>Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -&gt; xe-pw-137501v1</li>
</ul>
<p>IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7bb6237a94ee46cc76e<br />
  xe-pw-137501v1: 137501v1</p>

</body>
</html>

--===============8876856704892230673==--
