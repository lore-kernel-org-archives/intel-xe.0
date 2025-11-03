Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805E2CCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 08:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0D710E179;
	Mon,  3 Nov 2025 08:20:39 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665810E179;
 Mon,  3 Nov 2025 08:20:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7213622341196502973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improve_VMA_merging_for_CP?=
 =?utf-8?q?U-address-mirrored_mappings_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 08:20:37 -0000
Message-ID: <176215803747.10701.18005294730871557738@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
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

--===============7213622341196502973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve VMA merging for CPU-address-mirrored mappings (rev4)
URL   : https://patchwork.freedesktop.org/series/154832/
State : failure

== Summary ==

CI Bug Log - changes from xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515_FULL -> xe-pw-154832v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154832v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154832v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154832v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-434/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-435/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_vrr@negative-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-154832v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#2953] / [Intel XE#4173]) +11 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-9/igt@kms_atomic_interruptible@legacy-cursor.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-3/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1467])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][12] -> [DMESG-FAIL][13] ([Intel XE#4543])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1512])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2669]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#4417]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#373])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#306])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-bmg:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#3428]) +3 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_color@legacy-gamma-reset.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#307])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#309])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#5299])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2244])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#4422])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1421])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][40] -> [DMESG-WARN][41] ([Intel XE#4543])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#5352]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401] / [Intel XE#1745])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1401])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293] / [Intel XE#2380])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#455]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#5390]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#651]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#656])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4090])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4596])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1439] / [Intel XE#836])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#2893])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#4609])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1127])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#3414] / [Intel XE#3904])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vblank@wait-idle-hang@pipe-a-dp-2:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#6340]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_vblank@wait-idle-hang@pipe-a-dp-2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_vblank@wait-idle-hang@pipe-a-dp-2.html

  * igt@xe_eudebug@discovery-empty:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4837]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4837])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#688]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1392]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#288] / [Intel XE#5561]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4943]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4943]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#4915]) +10 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_exec_system_allocator@twice-malloc-nomemset.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#560])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102]) -> ([PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [SKIP][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128]) ([Intel XE#378])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-1/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-7/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#4733] / [Intel XE#5594])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#944])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][131] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][133] ([Intel XE#3862]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][135] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-bmg:          [DMESG-WARN][137] ([Intel XE#3428]) -> [PASS][138] +3 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][139] ([Intel XE#2291]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][141] ([Intel XE#1475]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][143] ([Intel XE#4302]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [FAIL][145] ([Intel XE#5916]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][147] ([Intel XE#2316]) -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#301]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][151] ([Intel XE#4543]) -> [PASS][152] +4 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][153] ([Intel XE#4543]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][155] ([Intel XE#1874]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][157] ([Intel XE#1503]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][159] ([Intel XE#1435]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#3868]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [WARN][163] ([Intel XE#5786]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_vm@bind-array-many:
    - shard-adlp:         [ABORT][167] ([Intel XE#3970]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-6/igt@xe_vm@bind-array-many.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_vm@bind-array-many.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][169] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][170] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][171] ([Intel XE#1178]) -> [SKIP][172] ([Intel XE#2341])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_content_protection@legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#5390]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][175] ([Intel XE#5390]) -> [SKIP][176] ([Intel XE#2312]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][177] ([Intel XE#2312]) -> [SKIP][178] ([Intel XE#2311]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][179] ([Intel XE#2311]) -> [SKIP][180] ([Intel XE#2312])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][181] ([Intel XE#2312]) -> [SKIP][182] ([Intel XE#2313]) +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][183] ([Intel XE#2313]) -> [SKIP][184] ([Intel XE#2312])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#3868]) -> [DMESG-WARN][186] ([Intel XE#3868])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5916
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6340
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515 -> xe-pw-154832v4

  IGT_8605: 8605
  xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515: b9356481c8ac3cba317f6c7af88db25452b0e515
  xe-pw-154832v4: 154832v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/index.html

--===============7213622341196502973==
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
<tr><td><b>Series:</b></td><td>Improve VMA merging for CPU-address-mirrored=
 mappings (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154832/">https://patchwork.freedesktop.org/series/154832/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154832v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154832v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4030-b9356481c8ac3cba317f6c7af88db2545=
2b0e515_FULL -&gt; xe-pw-154832v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154832v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154832v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1548=
32v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-434/igt@kms_fl=
ip@absolute-wf_vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-dg2-435/=
igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a6.html">INCOMPLETE</a=
> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-8/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_vrr@negative-basic.html">S=
KIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154832v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-9/igt@kms_ato=
mic_interruptible@legacy-cursor.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-3/igt@kms_atomic_i=
nterruptible@legacy-cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-1/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-6/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adl=
p-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
68">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_chamelium_audio@dp-audio=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_colo=
r@legacy-gamma-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_color@legacy-gamma-r=
eset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3428">Intel XE#3428</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/s=
hard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-8/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_flip@wf=
_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) +3 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#46=
08</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane=
-move@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_vbla=
nk@wait-idle-hang@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_vblank@wait=
-idle-hang@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6340">Intel XE#6340</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@xe_eudebug_online@preempt-bre=
akpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_evict@evict-mixed-threads-=
small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_exec_system_allocator@once=
-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-bmg-5/igt@xe_exec_system_allocator@thre=
ads-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_exec_system_allocator@twi=
ce-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0=
e515/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db254=
52b0e515/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88d=
b25452b0e515/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7a=
f88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f=
6c7af88db25452b0e515/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac3cba=
317f6c7af88db25452b0e515/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481c8ac=
3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b9356481=
c8ac3cba317f6c7af88db25452b0e515/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-b935=
6481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4030-=
b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154832v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154832v4/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154832v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154832v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154832v4/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_pxp@pxp-termination-key-u=
pdate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154832v4/shard-lnl-4/igt@xe_query@multigpu-query-confi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154832v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard=
-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_curs=
or_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-bmg-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/sha=
rd-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5916">Intel XE#5916</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-8/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_flip@2x-fl=
ip-vs-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154832v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-8/=
igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> +4 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-2/=
igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
32v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-4/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-1/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-3/igt@xe_exec=
_reset@cm-close-fd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-1/igt@xe_ex=
ec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/sh=
ard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-8/igt@xe_pm@s=
2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE=
#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154832v4/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-many:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-6/igt@xe_vm@b=
ind-array-many.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_vm@bind-arr=
ay-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-154832v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168"=
>Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4=
/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#53=
90</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
32v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154832v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154832v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515/shard-adlp-6/igt@xe_exec=
_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v4/shard-adlp-4/igt@xe_e=
xec_reset@cm-cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515 -&gt; xe-pw-154=
832v4</li>
</ul>
<p>IGT_8605: 8605<br />
  xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515: b9356481c8ac3cba317f6c7=
af88db25452b0e515<br />
  xe-pw-154832v4: 154832v4</p>

</body>
</html>

--===============7213622341196502973==--
