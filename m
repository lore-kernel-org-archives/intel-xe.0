Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750B6FCE087
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 13:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFE910E02E;
	Thu, 26 Feb 2026 13:59:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B3A10E02E;
 Thu, 26 Feb 2026 13:59:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7780664541723028032=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Revert_=22drm/xe/compat=3A?=
 =?utf-8?q?_Remove_unused_i915=5Freg=2Eh_from_compat_header=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 13:59:30 -0000
Message-ID: <177211437092.291873.4121742110449991288@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226113413.2045899-1-uma.shankar@intel.com>
In-Reply-To: <20260226113413.2045899-1-uma.shankar@intel.com>
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

--===============7780664541723028032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "drm/xe/compat: Remove unused i915_reg.h from compat header"
URL   : https://patchwork.freedesktop.org/series/162209/
State : failure

== Summary ==

CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_FULL -> xe-pw-162209v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162209v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162209v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162209v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][5] ([Intel XE#7480]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in xe-pw-162209v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2370])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7059])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7059])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1512]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652]) +12 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2:
    - shard-lnl:          NOTRUN -> [FAIL][24] ([Intel XE#7305]) +9 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2341])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3278] / [Intel XE#6973])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6974])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#6707])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2321])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2321]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2244]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2244])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#301]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7178]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7178]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6312])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2313]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#656]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3374] / [Intel XE#3544])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#3544])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4090])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7173] / [Intel XE#7294])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7283])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2393])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#5175])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#1727] / [Intel XE#6819])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#870])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2893])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2893] / [Intel XE#4608])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4608]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1127])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2330])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6503]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_sharpness_filter@filter-dpms.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6540] / [Intel XE#688])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#6321])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7482]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1392]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2322]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7136]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7136]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#6874]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6874]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - shard-bmg:          [PASS][85] -> [ABORT][86] ([Intel XE#5545] / [Intel XE#6652])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-many-queues:
    - shard-bmg:          NOTRUN -> [FAIL][87] ([Intel XE#7166])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_exec_threads@threads-many-queues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#7138]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#7138]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6964]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1061] / [Intel XE#7326])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@xe_peer2peer@read.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#584])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2284]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4733]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_pxp@pxp-optout.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4130])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][97] ([Intel XE#6054]) -> [PASS][98] +3 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [ABORT][99] ([Intel XE#5545]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][101] ([Intel XE#6321]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][103] ([Intel XE#5625]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [INCOMPLETE][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][107] ([Intel XE#6569]) -> [PASS][108] +2 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-bmg:          [FAIL][109] ([Intel XE#5937]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@xe_sriov_vram@vf-access-beyond.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_sriov_vram@vf-access-beyond.html

  
#### Warnings ####

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][111] ([Intel XE#6705]) -> [SKIP][112] ([Intel XE#6705] / [Intel XE#6973])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_content_protection@suspend-resume.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][113] ([Intel XE#3278]) -> [SKIP][114] ([Intel XE#3278] / [Intel XE#6973]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/igt@kms_content_protection@uevent.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          [SKIP][115] ([Intel XE#1406] / [Intel XE#4608]) -> [SKIP][116] ([Intel XE#4608]) +19 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][117] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) -> [SKIP][118] ([Intel XE#2893] / [Intel XE#4608]) +9 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][119] ([Intel XE#1406] / [Intel XE#2893]) -> [SKIP][120] ([Intel XE#2893]) +19 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][121] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][122] ([Intel XE#1489]) +39 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][123] ([Intel XE#1128] / [Intel XE#1406]) -> [SKIP][124] ([Intel XE#1128]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][125] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][126] ([Intel XE#2387]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][127] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][128] ([Intel XE#2234] / [Intel XE#2850]) +61 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][129] ([Intel XE#1406] / [Intel XE#2234]) -> [SKIP][130] ([Intel XE#2234])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-9/igt@kms_psr@psr2-primary-render.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][131] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][132] ([Intel XE#2414]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][133] ([Intel XE#2426]) -> [SKIP][134] ([Intel XE#2509])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][135] ([Intel XE#5466]) -> [ABORT][136] ([Intel XE#5466] / [Intel XE#6652])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6973]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7480
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_8772 -> IGT_8773
  * Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -> xe-pw-162209v1

  IGT_8772: 8772
  IGT_8773: 8773
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440
  xe-pw-162209v1: 162209v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/index.html

--===============7780664541723028032==
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
<tr><td><b>Series:</b></td><td>Revert &quot;drm/xe/compat: Remove unused i915_reg.h from compat header&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162209/">https://patchwork.freedesktop.org/series/162209/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_FULL -&gt; xe-pw-162209v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162209v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162209v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162209v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-fencing.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7480">Intel XE#7480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162209v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305">Intel XE#7305</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-3-pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-9/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-3/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-many-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_exec_threads@threads-many-queues.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166">Intel XE#7166</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-6/igt@xe_sriov_vram@vf-access-beyond.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@xe_sriov_vram@vf-access-beyond.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-8/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-8/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-9/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162209v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8772 -&gt; IGT_8773</li>
<li>Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -&gt; xe-pw-162209v1</li>
</ul>
<p>IGT_8772: 8772<br />
  IGT_8773: 8773<br />
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440<br />
  xe-pw-162209v1: 162209v1</p>

</body>
</html>

--===============7780664541723028032==--
