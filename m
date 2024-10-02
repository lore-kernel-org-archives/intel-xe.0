Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6FBCF31AD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 09:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A015010E6DE;
	Wed,  2 Oct 2024 09:31:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA7E10E6DD;
 Wed,  2 Oct 2024 09:31:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5258543010609577631=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_Fix_spellin?=
 =?utf-8?q?g_mistake_=22Uncomressed=22_-=3E_=22Uncompressed=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 09:31:37 -0000
Message-ID: <172786149722.1161987.5366171231094871475@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002074903.833232-1-colin.i.king@gmail.com>
In-Reply-To: <20241002074903.833232-1-colin.i.king@gmail.com>
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

--===============5258543010609577631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed"
URL   : https://patchwork.freedesktop.org/series/139406/
State : failure

== Summary ==

CI Bug Log - changes from xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec_full -> xe-pw-139406v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139406v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139406v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139406v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_3d.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - {shard-bmg}:        [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - {shard-bmg}:        [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - {shard-bmg}:        [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  
Known issues
------------

  Here are the changes found in xe-pw-139406v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#827]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#1874]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@kms_async_flips@crc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-6/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          NOTRUN -> [FAIL][17] ([Intel XE#1701]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#1659])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1428])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +20 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1195])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#323])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#309]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#599]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1421]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#886]) +6 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#651]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1469]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#653]) +12 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1616]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][52] ([Intel XE#324]) +2 other tests dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#324]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][55] ([Intel XE#324]) +2 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#361])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1620] / [Intel XE#2864])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#1620])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1489]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1122])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2850]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1127])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#2159]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#2443]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#756])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1126])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#688]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1392]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#288]) +10 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2833])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2248])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#977])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#584])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][80] -> [ABORT][81] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][82] -> [ABORT][83] ([Intel XE#1358] / [Intel XE#1607])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@xe_pm@s4-exec-after.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][84] -> [ABORT][85] ([Intel XE#1794])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#944])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][87] ([Intel XE#1760])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#2780])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#1033]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][92] ([Intel XE#1426]) -> [PASS][93] +3 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [FAIL][94] ([Intel XE#2577]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - {shard-bmg}:        [DMESG-WARN][96] ([Intel XE#877]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@torture-move:
    - {shard-bmg}:        [INCOMPLETE][98] -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-7/igt@kms_cursor_legacy@torture-move.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-5/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][100] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1195]) -> [PASS][103] +3 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][104] ([Intel XE#886]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][106] ([Intel XE#2597]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-lnl:          [INCOMPLETE][108] ([Intel XE#2049]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][110] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          [DMESG-WARN][112] -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][114] ([Intel XE#1874]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][116] ([Intel XE#324]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_plane@plane-position-covered.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][118] ([Intel XE#324]) -> [PASS][119] +3 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#361]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@legacy-planes@plane-68:
    - shard-adlp:         [DMESG-WARN][122] -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-2/igt@kms_pm_rpm@legacy-planes@plane-68.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-4/igt@kms_pm_rpm@legacy-planes@plane-68.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][124] ([Intel XE#899]) -> [PASS][125] +2 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][126] ([Intel XE#2364]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#1000]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][130] -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#358]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-9/igt@xe_exec_reset@cat-error.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-FAIL][134] ([Intel XE#1620]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [FAIL][136] ([Intel XE#2249]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [FAIL][138] ([Intel XE#2723]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@xe_oa@oa-exponents.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][140] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][142] ([Intel XE#324]) -> [FAIL][143] ([Intel XE#1204])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][144] ([Intel XE#1231]) -> [DMESG-FAIL][145] ([Intel XE#324])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][146] ([Intel XE#1035]) -> [INCOMPLETE][147] ([Intel XE#1035] / [Intel XE#1195]) +1 other test incomplete
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-3/igt@kms_plane@pixel-format.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@kms_plane@pixel-format.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][148] ([Intel XE#358]) -> [DMESG-FAIL][149] ([Intel XE#1962])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2780
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec -> xe-pw-139406v1

  IGT_8047: 2a1ef45992ee7569d9fc37be875fa78ce3aa5ab8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec: fcdbbdcd11d425434efc837037141c9dfb0fcdec
  xe-pw-139406v1: 139406v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/index.html

--===============5258543010609577631==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Fix spelling mistake &quot;Uncomressed&quot; -&gt; &quot;Uncompressed&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139406/">https://patchwork.freedesktop.org/series/139406/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec_full -&gt; xe-pw-139406v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139406v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139406v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139406v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139406v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-6/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2780">Intel XE#2780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-7/igt@kms_cursor_legacy@torture-move.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-5/igt@kms_cursor_legacy@torture-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-2/igt@kms_pm_rpm@legacy-planes@plane-68.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-4/igt@kms_pm_rpm@legacy-planes@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-9/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-5/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-6/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-9/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139406v1/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec -&gt; xe-pw-139406v1</li>
</ul>
<p>IGT_8047: 2a1ef45992ee7569d9fc37be875fa78ce3aa5ab8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2001-fcdbbdcd11d425434efc837037141c9dfb0fcdec: fcdbbdcd11d425434efc837037141c9dfb0fcdec<br />
  xe-pw-139406v1: 139406v1</p>

</body>
</html>

--===============5258543010609577631==--
