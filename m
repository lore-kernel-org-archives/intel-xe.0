Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F751E7717F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 02:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E695710E188;
	Wed, 11 Dec 2024 02:18:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4F10E188;
 Wed, 11 Dec 2024 02:18:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6257541895674758289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Converge_on_using_secs=5Ft?=
 =?utf-8?q?o=5Fjiffies=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 02:18:53 -0000
Message-ID: <173388353374.1048316.10165222451708880058@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
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

--===============6257541895674758289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Converge on using secs_to_jiffies() (rev3)
URL   : https://patchwork.freedesktop.org/series/141435/
State : failure

== Summary ==

CI Bug Log - changes from xe-2348-2223c2c738ecb056c0a77e115334887da66668c8_full -> xe-pw-141435v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141435v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141435v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141435v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [CRASH][2] +3 other tests crash
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +3 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_color@deep-color.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_color@deep-color.html

  * igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +6 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy.html

  
#### Warnings ####

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#3468]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-141435v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3468]) +9 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#1727] / [Intel XE#3468])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][12] ([Intel XE#3781])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][13] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#619])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#2191]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +14 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#373]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1188])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#309]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2291]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2291])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#877]) +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#702])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1137])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2316]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#2882]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][34] ([Intel XE#3468]) +31 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@blocking-absolute-wf_vblank@b-dp2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2635])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293] / [Intel XE#2380])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#656]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#651]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2313]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#653]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1503])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3468])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1489]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1489])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2234] / [Intel XE#2850])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#1874])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-bmg:          [PASS][53] -> [DMESG-FAIL][54] ([Intel XE#3468])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@wait-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][55] ([Intel XE#3468]) +8 other tests dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_vblank@wait-forked@pipe-a-dp-2.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1447])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1126])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2905])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#2905]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1392]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#288]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_exec_fault_mode@once-bindexecqueue.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2705])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#3573])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1337])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          NOTRUN -> [ABORT][67] ([Intel XE#1616] / [Intel XE#3468])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][68] -> [ABORT][69] ([Intel XE#1358] / [Intel XE#1607])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#944])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
    - shard-bmg:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][73] ([Intel XE#1426]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][75] ([Intel XE#3468]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][77] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-a:
    - shard-bmg:          [DMESG-WARN][79] ([Intel XE#3468]) -> [PASS][80] +10 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [SKIP][81] ([Intel XE#2291]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][83] ([Intel XE#2316]) -> [PASS][84] +2 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][85] ([Intel XE#2882]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][87] ([Intel XE#1503]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_hdr@static-swap.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][89] ([Intel XE#3012]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-adlp:         [TIMEOUT][91] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][92] +3 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][93] ([Intel XE#1435]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][95] ([Intel XE#899]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][97] -> [PASS][98] +8 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [DMESG-WARN][99] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-adlp:         [DMESG-WARN][101] ([Intel XE#3086]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-1/igt@xe_pm@s4-exec-after.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-1/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][105] ([Intel XE#1794]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][107] ([Intel XE#958]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [DMESG-FAIL][109] ([Intel XE#3468]) -> [DMESG-FAIL][110] ([Intel XE#1727] / [Intel XE#3468])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][111] ([Intel XE#3468]) -> [DMESG-FAIL][112] ([Intel XE#3468] / [Intel XE#877])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][113] ([Intel XE#3468]) -> [DMESG-FAIL][114] ([Intel XE#3468]) +6 other tests dmesg-fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [DMESG-FAIL][115] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][116] ([Intel XE#3468]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [TIMEOUT][117] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [DMESG-FAIL][118] ([Intel XE#324])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][119] ([Intel XE#2341]) -> [FAIL][120] ([Intel XE#1188])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_content_protection@uevent.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-bmg:          [DMESG-FAIL][121] ([Intel XE#3468]) -> [DMESG-WARN][122] ([Intel XE#3468]) +5 other tests dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-bmg:          [DMESG-WARN][123] ([Intel XE#3468]) -> [DMESG-FAIL][124] ([Intel XE#2705] / [Intel XE#3468]) +2 other tests dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][125] ([Intel XE#877]) -> [SKIP][126] ([Intel XE#2291])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [DMESG-FAIL][127] ([Intel XE#3468]) -> [SKIP][128] ([Intel XE#2316])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#3468]) -> [SKIP][130] ([Intel XE#2316])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-panning@b-dp2:
    - shard-bmg:          [DMESG-WARN][131] -> [DMESG-WARN][132] ([Intel XE#3468]) +1 other test dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip@flip-vs-panning@b-dp2.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip@flip-vs-panning@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][133] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][134] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [DMESG-WARN][135] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [INCOMPLETE][136] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test incomplete
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          [INCOMPLETE][137] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][138] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         [TIMEOUT][139] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][140] ([Intel XE#656])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][141] ([Intel XE#3468]) -> [FAIL][142] ([Intel XE#2333])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][143] ([Intel XE#2333]) -> [SKIP][144] ([Intel XE#2312]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][145] ([Intel XE#3468]) -> [SKIP][146] ([Intel XE#2312])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [DMESG-FAIL][148] ([Intel XE#3468]) +1 other test dmesg-fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][149] ([Intel XE#2312]) -> [FAIL][150] ([Intel XE#2333]) +3 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [INCOMPLETE][151] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][152] ([Intel XE#2312])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][153] ([Intel XE#2312]) -> [SKIP][154] ([Intel XE#2311]) +9 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][155] ([Intel XE#2311]) -> [SKIP][156] ([Intel XE#2312]) +11 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][157] ([Intel XE#2312]) -> [SKIP][158] ([Intel XE#2313]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][159] ([Intel XE#2313]) -> [SKIP][160] ([Intel XE#2312]) +9 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         [TIMEOUT][161] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][162] ([Intel XE#3414])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-bmg:          [DMESG-WARN][163] ([Intel XE#3468]) -> [DMESG-WARN][164] ([Intel XE#1727] / [Intel XE#3468])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][165] ([Intel XE#1473]) -> [FAIL][166] ([Intel XE#1000])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][167] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][168] ([Intel XE#3343])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][169] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][170] ([Intel XE#3468] / [Intel XE#569])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#3468]) -> [DMESG-WARN][172] ([Intel XE#2705])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2348-2223c2c738ecb056c0a77e115334887da66668c8 -> xe-pw-141435v3

  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2348-2223c2c738ecb056c0a77e115334887da66668c8: 2223c2c738ecb056c0a77e115334887da66668c8
  xe-pw-141435v3: 141435v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/index.html

--===============6257541895674758289==
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
<tr><td><b>Series:</b></td><td>Converge on using secs_to_jiffies() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141435/">https://patchwork.freedesktop.org/series/141435/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2348-2223c2c738ecb056c0a77e115334887da66668c8_full -&gt; xe-pw-141435v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141435v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141435v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141435v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_async_flips@crc-atomic.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">CRASH</a> +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_color@deep-color.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-vram01-vram01-multicopy.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141435v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_addfb_basic@unused-handle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@blocking-absolute-wf_vblank@b-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_vblank@wait-forked@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_exec_fault_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-5/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-1/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-1/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip@flip-vs-panning@b-dp2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip@flip-vs-panning@b-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2348-2223c2c738ecb056c0a77e115334887da66668c8/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141435v3/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2348-2223c2c738ecb056c0a77e115334887da66668c8 -&gt; xe-pw-141435v3</li>
</ul>
<p>IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2348-2223c2c738ecb056c0a77e115334887da66668c8: 2223c2c738ecb056c0a77e115334887da66668c8<br />
  xe-pw-141435v3: 141435v3</p>

</body>
</html>

--===============6257541895674758289==--
