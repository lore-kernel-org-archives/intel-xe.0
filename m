Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35020D20683
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 13:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51CF10E981;
	Thu,  4 Dec 2025 13:34:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6A10E97D;
 Thu,  4 Dec 2025 13:34:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2812556732042919298=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHhlOiBmaXggZHJtX2dwdXN2bV9p?=
 =?utf-8?b?bml0KCkgYXJndW1lbnRz?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 13:34:04 -0000
Message-ID: <176485524425.56921.16983016019293428613@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204094704.1030933-1-arnd@kernel.org>
In-Reply-To: <20251204094704.1030933-1-arnd@kernel.org>
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

--===============2812556732042919298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: fix drm_gpusvm_init() arguments
URL   : https://patchwork.freedesktop.org/series/158484/
State : failure

== Summary ==

CI Bug Log - changes from xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a_FULL -> xe-pw-158484v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158484v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158484v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158484v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  
Known issues
------------

  Here are the changes found in xe-pw-158484v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#3157])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         NOTRUN -> [ABORT][4] ([Intel XE#6675]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][7] ([Intel XE#1874])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#367]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#787]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#2907]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6014] / [Intel XE#6168] / [i915#14968])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2724])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#373]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#6704])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf.html

  * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6704]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf.html

  * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6704]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#308]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#4354])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2375])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#310]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1421]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [ABORT][34] ([Intel XE#6675]) +3 other tests abort
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2293] / [Intel XE#2380])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2293])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#651]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#656]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#651])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#6312])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#653]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][46] ([Intel XE#6740])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#2925] / [Intel XE#3012])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#870])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - shard-lnl:          [PASS][52] -> [ABORT][53] ([Intel XE#2625] / [Intel XE#6675]) +1 other test abort
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1406])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#4609])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#3414] / [Intel XE#3904])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6503])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][59] ([Intel XE#4488])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1123])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#5626])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-close:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4837] / [Intel XE#5565])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4837])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4837])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6665])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#4837] / [Intel XE#5565] / [Intel XE#6665]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#261])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#688]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#261] / [Intel XE#688])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1392] / [Intel XE#5575])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3868])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4943]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4943]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#4915]) +66 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#6558]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#3573]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2284] / [Intel XE#366])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#6675]) +1 other test abort
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][85] -> [ABORT][86] ([Intel XE#6675]) +5 other tests abort
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
    - shard-bmg:          [PASS][87] -> [ABORT][88] ([Intel XE#6675]) +1 other test abort
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [ABORT][89] ([Intel XE#6675])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#584])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          NOTRUN -> [FAIL][91] ([Intel XE#6251]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#944])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#944])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#6703]) +69 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_query@query-gt-list.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_query@query-gt-list.html

  * igt@xe_survivability@runtime-survivability:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#6529])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][97] ([Intel XE#6054]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][99] ([Intel XE#1231] / [Intel XE#6699]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [ABORT][101] ([Intel XE#6675]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [ABORT][103] ([Intel XE#6675]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pmu@engine-activity-suspend:
    - shard-lnl:          [ABORT][105] ([Intel XE#6675]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-2/igt@xe_pmu@engine-activity-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_pmu@engine-activity-suspend.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [FAIL][107] ([Intel XE#6054] / [Intel XE#6676]) -> [FAIL][108] ([Intel XE#6676])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][109] ([Intel XE#1124]) -> [SKIP][110] ([Intel XE#6703]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-bmg:          [SKIP][111] ([Intel XE#2887]) -> [SKIP][112] ([Intel XE#6703])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][113] ([Intel XE#2887]) -> [SKIP][114] ([Intel XE#6557] / [Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][116] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][117] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][118] ([Intel XE#6703])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-bmg:          [SKIP][119] ([Intel XE#2252]) -> [SKIP][120] ([Intel XE#6703])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_chamelium_edid@vga-edid-read.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][121] ([Intel XE#2320]) -> [SKIP][122] ([Intel XE#6703])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][123] ([Intel XE#2321]) -> [SKIP][124] ([Intel XE#6703])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][125] ([Intel XE#2374]) -> [SKIP][126] ([Intel XE#6557] / [Intel XE#6703])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_feature_discovery@psr1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          [SKIP][127] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#2311]) -> [SKIP][130] ([Intel XE#6703]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][131] ([Intel XE#4141]) -> [SKIP][132] ([Intel XE#6703])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][133] ([Intel XE#2311]) -> [SKIP][134] ([Intel XE#6557] / [Intel XE#6703])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][135] ([Intel XE#2313]) -> [SKIP][136] ([Intel XE#6703]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][137] ([Intel XE#1503]) -> [ABORT][138] ([Intel XE#6740])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][139] ([Intel XE#870]) -> [SKIP][140] ([Intel XE#6703])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][141] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][142] ([Intel XE#1406] / [Intel XE#6703])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-bmg:          [SKIP][143] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][144] ([Intel XE#1406] / [Intel XE#6703])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_psr@psr2-sprite-plane-move.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][145] ([Intel XE#2330]) -> [SKIP][146] ([Intel XE#6703])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          [SKIP][147] ([Intel XE#6503]) -> [SKIP][148] ([Intel XE#6703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_sharpness_filter@filter-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_sharpness_filter@filter-suspend.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][149] ([Intel XE#4837]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          [SKIP][151] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][152] ([Intel XE#6703]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          [SKIP][153] ([Intel XE#2322]) -> [SKIP][154] ([Intel XE#6703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][155] ([Intel XE#4943]) -> [SKIP][156] ([Intel XE#6703]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          [SKIP][157] ([Intel XE#2229]) -> [FAIL][158] ([Intel XE#6558])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][159] ([Intel XE#4733]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6558
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a -> xe-pw-158484v1

  IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a: 4eb27c4b4b45606c79769918ab8736249f94035a
  xe-pw-158484v1: 158484v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/index.html

--===============2812556732042919298==
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
<tr><td><b>Series:</b></td><td>xe: fix drm_gpusvm_init() arguments</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158484/">https://patchwork.freedesktop.org/series/158484/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158484v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158484v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4194-4eb27c4b4b45606c79769918ab8736249=
f94035a_FULL -&gt; xe-pw-158484v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158484v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-158484v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1584=
84v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/ig=
t@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a=
></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158484v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_async_flips@async-flip-s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6014">Intel XE#6014</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i915#14968</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc=
-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd=
-after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_colorop@plane-xr24-xr24-=
pq_125_eotf-pq_125_inv_eotf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6704">Intel XE#6704</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_colorop@plane-xr30-xr30-b=
t2020_inv_oetf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6704">Intel XE#6704</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_colorop@plane-xr30-xr30-s=
rgb_inv_eotf_lut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6704">Intel XE#6704</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6675">Intel XE#6675</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hd=
mi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_psr@fbc-psr-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-2/igt@kms_psr@=
fbc-psr-suspend@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-2/igt@kms_psr@fbc-psr-suspend=
@edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@kms_sharpness_filter@filter-m=
odifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dp=
ms-suspend@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_eu_stall@blocking-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_eudebug@basic-close.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-exte=
nded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_eudebug@discovery-race-sig=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_eudebug_online@pagefault-w=
rite-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_eudebug_online@writes-cac=
hing-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel X=
E#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_evict@evict-beng-large-mu=
lti-vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_evict@evict-small-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-9/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158484v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_exec_system_allocator@many=
-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_exec_system_allocator@many=
-stride-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +66 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6558">Int=
el XE#6558</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-5/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-9/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158484v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6675">Intel XE#6675</a>) +5 other tests abort</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-2/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-6/igt@xe_pm@s4-multiple-execs.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_pm@s4-vm-bind-prefetch.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6675">Intel XE#6675</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pm_residency@cpg-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-lnl-1/igt@xe_pmu@engine-activity-accura=
cy-90.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-bmg-1/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_query@multigpu-query-inva=
lid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_query=
@query-gt-list.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_query@query-gt-list.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158484v1/shard-adlp-8/igt@xe_survivability@runtime-sur=
vivability.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6529">Intel XE#6529</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605=
4">Intel XE#6054</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158484v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-f=
lip-events-linear-atomic@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699"=
>Intel XE#6699</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158484v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-7/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg=
-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-adlp-3/igt@xe_pm@s=
3-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-adlp-9/igt@xe_pm@s3-d=
3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-2/igt@xe_pmu@e=
ngine-activity-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-lnl-4/igt@xe_pmu@=
engine-activity-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6=
054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/66=
76">Intel XE#6676</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-158484v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-=
flip-events-linear-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@=
ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/ig=
t@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shar=
d-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">In=
tel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158484v1/shard-dg2-433/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/sha=
rd-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_cham=
elium_edid@vga-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_ch=
amelium_edid@vga-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_curs=
or_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_=
cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-=
bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
8484v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-5/igt@kms_hdr@invalid-hdr=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms_pm_=
backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1584=
84v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_psr@=
psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1584=
84v1/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-b=
mg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@kms_shar=
pness_filter@filter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@kms=
_sharpness_filter@filter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_eudeb=
ug@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_eudebug=
@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_eudeb=
ug_online@writes-caching-vram-bb-sram-target-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665"=
>Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158484v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb=
-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_exec_=
basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@x=
e_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Int=
el XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-158484v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-m=
any-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_live_=
ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/ig=
t@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6558">Intel XE#6558</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a/shard-bmg-6/igt@xe_pxp@p=
xp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158484v1/shard-bmg-2/igt@x=
e_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a -&gt; xe-pw-158=
484v1</li>
</ul>
<p>IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4194-4eb27c4b4b45606c79769918ab8736249f94035a: 4eb27c4b4b45606c7976991=
8ab8736249f94035a<br />
  xe-pw-158484v1: 158484v1</p>

</body>
</html>

--===============2812556732042919298==--
