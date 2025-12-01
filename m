Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EDAD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351D10E155;
	Mon,  1 Dec 2025 17:25:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85410E155;
 Mon,  1 Dec 2025 17:25:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2908445739050625799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Selective_Fetch_and_async_?=
 =?utf-8?q?flip_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 17:25:55 -0000
Message-ID: <176460995556.44343.5237246913255947443@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201132457.624358-1-jouni.hogander@intel.com>
In-Reply-To: <20251201132457.624358-1-jouni.hogander@intel.com>
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

--===============2908445739050625799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Selective Fetch and async flip (rev3)
URL   : https://patchwork.freedesktop.org/series/158002/
State : failure

== Summary ==

CI Bug Log - changes from xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c_FULL -> xe-pw-158002v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158002v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158002v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158002v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html

  
Known issues
------------

  Here are the changes found in xe-pw-158002v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#1125] / [Intel XE#5574])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#316])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][6] -> [FAIL][7] ([Intel XE#1231])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#607])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#2191])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#2907])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#787]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#306])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#373]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6507])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_colorop@plane-xr30-xr30-bypass:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#6704]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_colorop@plane-xr30-xr30-bypass.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2390])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][25] ([Intel XE#6675]) +1 other test abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#309])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2291])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#5299])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#4331])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2244]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#702])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2316])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#310])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1874])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#651]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#656]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#653]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2312]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2925] / [Intel XE#346])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4329])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-bmg:          [PASS][50] -> [ABORT][51] ([Intel XE#6675])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2393])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#4596])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#2414])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1127])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1435])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][64] -> [ABORT][65] ([Intel XE#6675]) +2 other tests abort
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          NOTRUN -> [ABORT][66] ([Intel XE#6675]) +3 other tests abort
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#6360])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x8fffe:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#5503])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x8fffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#944]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#5626])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_eudebug@basic-vm-access-parameters-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4837])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#261])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2322])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#288] / [Intel XE#5561]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#4915]) +76 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_system_allocator@many-mmap-shared.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][79] -> [WARN][80] ([Intel XE#5786])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap:
    - shard-bmg:          [PASS][81] -> [ABORT][82] ([Intel XE#3970])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4943]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [PASS][84] -> [FAIL][85] ([Intel XE#6407])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-dg2-466/igt@xe_gt_freq@freq_fixed_idle.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-dg2-432/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][86] -> [DMESG-WARN][87] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5244])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@many-reload.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#3573]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][89] -> [ABORT][90] ([Intel XE#6675]) +7 other tests abort
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][91] -> [ABORT][92] ([Intel XE#6675]) +2 other tests abort
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#944])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#4814] / [Intel XE#5614])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#6376])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-dpms:
    - shard-lnl:          [FAIL][96] ([Intel XE#6676]) -> [PASS][97] +5 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-2/igt@kms_async_flips@async-flip-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-2/igt@kms_async_flips@async-flip-dpms.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:
    - shard-lnl:          [FAIL][98] ([Intel XE#6678]) -> [PASS][99] +5 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-3/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html

  * igt@kms_async_flips@test-time-stamp-atomic:
    - shard-lnl:          [FAIL][100] ([Intel XE#6677]) -> [PASS][101] +2 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_async_flips@test-time-stamp-atomic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-8/igt@kms_async_flips@test-time-stamp-atomic.html

  * igt@kms_cursor_crc@cursor-size-hints:
    - shard-bmg:          [INCOMPLETE][102] -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-3/igt@kms_cursor_crc@cursor-size-hints.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][104] ([Intel XE#2291]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][106] ([Intel XE#6715]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][108] ([Intel XE#301]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][110] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][112] ([Intel XE#1874]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [ABORT][114] ([Intel XE#6675]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][116] ([Intel XE#6321] / [Intel XE#6606]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][118], [PASS][119], [PASS][120], [PASS][121], [SKIP][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-3/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-3/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-9/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-9/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-9/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-6/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [ABORT][169] ([Intel XE#6675]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pmu@engine-activity-suspend:
    - shard-adlp:         [ABORT][171] ([Intel XE#6675]) -> [PASS][172] +3 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_pmu@engine-activity-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_pmu@engine-activity-suspend.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][173] ([Intel XE#5993] / [Intel XE#6676]) -> [FAIL][174] ([Intel XE#5993])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1:
    - shard-lnl:          [FAIL][175] ([Intel XE#6676]) -> [FAIL][176] ([Intel XE#5993]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [INCOMPLETE][177] -> [SKIP][178] ([Intel XE#4302])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [ABORT][179] ([Intel XE#6675]) -> [SKIP][180] ([Intel XE#2316])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][181] ([Intel XE#2311]) -> [SKIP][182] ([Intel XE#2312]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#4141])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#4141]) -> [SKIP][186] ([Intel XE#2312]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2313]) -> [SKIP][188] ([Intel XE#2312]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2313]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6677
  [Intel XE#6678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6678
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c -> xe-pw-158002v3

  IGT_8646: 8646
  xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c: 7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c
  xe-pw-158002v3: 158002v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/index.html

--===============2908445739050625799==
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
<tr><td><b>Series:</b></td><td>Selective Fetch and async flip (rev3)</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158002/">https://patchwork.freedesktop.org/series/158002/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158002v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158002v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd=
41fec0c_FULL -&gt; xe-pw-158002v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158002v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-158002v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1580=
02v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_content_protection@dp-mst-suspend-resume:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_content_protection@dp-mst=
-suspend-resume.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158002v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@intel_hwmon@hwmon-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5574">Intel XE#5574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adl=
p-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231=
">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bypass:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_colorop@plane-xr30-xr30-=
bypass.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6704">Intel XE#6704</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend=
@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_cursor_legacy@2x-long-no=
nblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_cursor_=
legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_flip@2x-wf_vblank-ts-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2925">Intel XE#2925</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/igt@k=
ms_plane@plane-panning-bottom-right-suspend@pipe-a.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_psr@fbc-psr-primary-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-4/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-=
lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6675">Intel XE#6675</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-=
compressed-compfmt0-system-vram01.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +3 other te=
sts abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_compute_preempt@compute-p=
reempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x8fffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5503">Intel XE#5503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_eu_stall@invalid-event-re=
port-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_eudebug@basic-vm-access-p=
arameters-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-lnl-5/igt@xe_eudebug_online@breakpoint-=
not-in-debug-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_evict@evict-beng-threads-=
small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_fault_mode@many-inva=
lid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_exec_system_allocator@man=
y-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4915">Intel XE#4915</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-mmap-remap-ro-dontunmap.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-b=
mg-5/igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@xe_exec_system_allocator@thre=
ads-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-dg2-466/igt@xe_gt_=
freq@freq_fixed_idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-158002v3/shard-dg2-432/igt@xe_gt_freq@freq_fixed_=
idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6407">Intel XE#6407</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5244">Intel XE#5244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6675">Intel XE#6675</a>) +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-dg2-463/igt@xe_pm@=
s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158002v3/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbi=
nd-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6675">Intel XE#6675</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_render_copy@render-stress=
-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_sriov_vram@vf-access-afte=
r-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-2/igt@kms_asy=
nc_flips@async-flip-dpms.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_asyn=
c_flips@invalid-async-flip@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6678">Intel XE#6678</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-l=
nl-3/igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1.html">PASS</a> +5 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_asyn=
c_flips@test-time-stamp-atomic.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6677">Intel XE#6677</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-8/ig=
t@kms_async_flips@test-time-stamp-atomic.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-3/igt@kms_curs=
or_crc@cursor-size-hints.html">INCOMPLETE</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-3/igt@kms_cursor_crc=
@cursor-size-hints.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-lnl-4/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1580=
02v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-4/igt@kms_vbla=
nk@ts-continuation-dpms-suspend@pipe-c-edp-1.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/s=
hard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">P=
ASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-3/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606">Intel XE#6606=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1580=
02v3/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/sha=
rd-adlp-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0=
c/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd4=
1fec0c/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4=
bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccf=
b7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e=
92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab11=
55b3e92ccfb7ae4bbfd41fec0c/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa0=
9ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b=
6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173=
-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0=
c/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd4=
1fec0c/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4=
bbfd41fec0c/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccf=
b7ae4bbfd41fec0c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e=
92ccfb7ae4bbfd41fec0c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab11=
55b3e92ccfb7ae4bbfd41fec0c/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v=
3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158002v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
8002v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-158002v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard=
-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158002v3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158002v3/shard-adlp-6/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/=
shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-158002v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1580=
02v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158002v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@xe_pm@s3=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-1/igt@xe_pm@s3-vm-=
bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-adlp-8/igt@xe_pmu@=
engine-activity-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-adlp-3/igt@xe_pm=
u@engine-activity-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Int=
el XE#6676</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-158002v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-ev=
ents-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5993">Intel XE#5993</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Inte=
l XE#6676</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158002v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-6/igt@kms_displ=
ay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158002v3/shard-bmg-2/=
igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
002v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58002v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58002v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58002v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158002v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c -&gt; xe-pw-158=
002v3</li>
</ul>
<p>IGT_8646: 8646<br />
  xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c: 7f7b6cfa09ab1155b3e92cc=
fb7ae4bbfd41fec0c<br />
  xe-pw-158002v3: 158002v3</p>

</body>
</html>

--===============2908445739050625799==--
