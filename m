Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DDDCCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 15:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924EB10E3D2;
	Wed, 29 Apr 2026 15:18:06 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E22C10E3D2;
 Wed, 29 Apr 2026 15:18:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1480259340180829810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_get-error-counter_and_?=
 =?utf-8?q?clear-error-counter_support_for_CRI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 15:18:05 -0000
Message-ID: <177747588537.24335.4698712229570782563@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429055147.1579576-8-riana.tauro@intel.com>
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
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

--===============1480259340180829810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add get-error-counter and clear-error-counter support for CRI (rev3)
URL   : https://patchwork.freedesktop.org/series/164393/
State : failure

== Summary ==

CI Bug Log - changes from xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a_FULL -> xe-pw-164393v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164393v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164393v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164393v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@i2c:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-6/igt@kms_pm_rpm@i2c.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-bmg:          [PASS][2] -> [ABORT][3] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  
Known issues
------------

  Here are the changes found in xe-pw-164393v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607] / [Intel XE#7361])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1477] / [Intel XE#7361])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +12 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7642])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7642])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2321] / [Intel XE#7355])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2320]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2321] / [Intel XE#7355])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#5354])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#309] / [Intel XE#7343])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2244])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2244])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4156] / [Intel XE#7425])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1421])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397] / [Intel XE#7385])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7178] / [Intel XE#7351]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +17 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4141]) +15 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7061] / [Intel XE#7356])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +25 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6911] / [Intel XE#7466])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7173] / [Intel XE#7294])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7130]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7130]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7283]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7283])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#5020] / [Intel XE#7348])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#7340])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7794])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6814] / [Intel XE#7428])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1489]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2387] / [Intel XE#7429]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6503]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2426] / [Intel XE#5848])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2450] / [Intel XE#5857])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7636]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7636]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7482]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1392]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7136]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7136]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6874]) +20 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7138]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7138]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#560] / [Intel XE#7321] / [Intel XE#7453])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_media_fill@media-fill.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6964]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#6964])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7793])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7793]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2245] / [Intel XE#7590])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#7590])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1948])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2284] / [Intel XE#7370])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#5937])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#944]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][92] ([Intel XE#5545])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-lnl:          [ABORT][93] ([Intel XE#4760]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][95] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][97] ([Intel XE#4692] / [Intel XE#7508]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_exec_threads@threads-bal-mixed-rebind:
    - shard-bmg:          [ABORT][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-9/igt@xe_exec_threads@threads-bal-mixed-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-rebind.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-8/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-7/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-6/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][152] ([Intel XE#3544]) -> [SKIP][153] ([Intel XE#3374] / [Intel XE#3544])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8877 -> IGT_8878
  * Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -> xe-pw-164393v3

  IGT_8877: 1749e432cd72ef2c99f1b4e9d6f24411f1161901 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8878: f69f699aab54bd96cd0ff78142b721475fdf1dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a
  xe-pw-164393v3: 164393v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/index.html

--===============1480259340180829810==
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
<tr><td><b>Series:</b></td><td>Add get-error-counter and clear-error-counte=
r support for CRI (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164393/">https://patchwork.freedesktop.org/series/164393/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164393v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164393v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4948-a53aafc879e9c52b2776089762591d276=
6a27f0a_FULL -&gt; xe-pw-164393v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164393v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-164393v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1643=
93v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-6/igt@kms_pm_rpm@i2c.html">INCOMPLE=
TE</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@kms_rot=
ation_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_=
rotation_crc@primary-4-tiled-reflect-x-180.html">ABORT</a> +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue=
-close-execqueues.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164393v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_content_protection@lic-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@kms_cur=
sor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_c=
ursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_plane@pixel-format-4-til=
ed-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-164393v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel X=
E#7340</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_pm_rpm@package-g7.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
14">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-=
update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7429">Intel XE#7429</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_psr@fbc-psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@kms_sharpness_filter@filter-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2450">Intel XE#2450</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_compute_preempt@compute-pr=
eempt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_evict@evict-cm-threads-sma=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_exec_balancer@once-virtual=
-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-ra=
ce-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-6/igt@xe_exec_fault_mode@many-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_exec_multi_queue@one-queue=
-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_exec_threads@threads-multi=
-queue-cm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7321">Intel XE#7321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_page_reclaim@boundary-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-10/igt@xe_pmu@=
fn-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-1/igt@xe_pmu@fn-en=
gine-activity-sched-if-idle.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-9/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-10/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164393v3/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@kms_big_=
fb@4-tiled-8bpp-rotate-180.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@kms=
_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Int=
el XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-164393v3/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508">Intel X=
E#7508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164393v3/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-9/igt@xe_exec_=
threads@threads-bal-mixed-rebind.html">ABORT</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-4/igt@xe_exec_thr=
eads@threads-bal-mixed-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-4/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a2=
7f0a/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d27=
66a27f0a/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b277608976259=
1d2766a27f0a/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b27760897=
62591d2766a27f0a/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776=
089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b=
2776089762591d2766a27f0a/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9=
c52b2776089762591d2766a27f0a/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc8=
79e9c52b2776089762591d2766a27f0a/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-a53a=
afc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4948-=
a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-lnl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0=
a/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
393v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
393v3/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-164393v3/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
393v3/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-164393v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
393v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-164393v3/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
393v3/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-164393v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-164393v3/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v3/shard-bmg-3/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8877 -&gt; IGT_8878</li>
<li>Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -&gt; xe-pw-164=
393v3</li>
</ul>
<p>IGT_8877: 1749e432cd72ef2c99f1b4e9d6f24411f1161901 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8878: f69f699aab54bd96cd0ff78142b721475fdf1dae @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089=
762591d2766a27f0a<br />
  xe-pw-164393v3: 164393v3</p>

</body>
</html>

--===============1480259340180829810==--
