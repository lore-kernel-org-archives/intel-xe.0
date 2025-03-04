Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF8C282C6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 13:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7810E5D0;
	Tue,  4 Mar 2025 13:46:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B7910E277;
 Tue,  4 Mar 2025 13:46:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9098648905398380827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_drm_sharpness_pr?=
 =?utf-8?q?operty_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 13:46:37 -0000
Message-ID: <174109599773.620516.12064204600530805736@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304102857.326544-1-nemesa.garg@intel.com>
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
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

--===============9098648905398380827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev10)
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc_full -> xe-pw-139954v10_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139954v10_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139954v10_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139954v10_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  
Known issues
------------

  Here are the changes found in xe-pw-139954v10_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#3767]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#610])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +120 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][12] ([Intel XE#3862]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#4417]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2724])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#4416]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#1178]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2321])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2291]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#309]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4354])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2244])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4422])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#3321]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#310]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2316])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][37] ([Intel XE#4330]) +7 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][40] ([Intel XE#4330]) +13 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#2049] / [Intel XE#2597])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1397]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4330]) +1 other test dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1401]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2311]) +22 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2312]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4141]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#656]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +22 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2502])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3544])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1450]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#4328])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2934]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][60] ([Intel XE#324]) +12 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][61] ([Intel XE#324]) +1 other test dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#599]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2493])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1489]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#3414] / [Intel XE#3904])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#4330]) +8 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_sequence@get-busy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_sequence@get-busy.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2426])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1499]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2905]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#1392]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2322]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#1999]) +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2248])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2245])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#4173]) +4 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2284]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][85] ([Intel XE#4330] / [Intel XE#569])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#579])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4130]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#3342])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-lnl:          [SKIP][90] ([Intel XE#2134]) -> [PASS][91] +2 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@fbdev@read.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@fbdev@read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][92] ([Intel XE#3908]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][94] ([Intel XE#4472]) -> [PASS][95] +52 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#2191]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][98] ([Intel XE#1511]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_color@deep-color.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-lnl:          [SKIP][100] -> [PASS][101] +18 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_color@degamma.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][102] ([Intel XE#4330]) -> [PASS][103] +17 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#309]) -> [PASS][105] +5 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][106] ([Intel XE#2291]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][108] ([Intel XE#4471]) -> [PASS][109] +39 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#3009]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_aux_dev.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-463/igt@kms_dp_aux_dev.html
    - shard-lnl:          [SKIP][112] ([Intel XE#3009]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_aux_dev.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#4354]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][116] ([Intel XE#1135]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feature_discovery@psr1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#310]) -> [PASS][119] +3 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][120] ([Intel XE#2316]) -> [PASS][121] +2 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [DMESG-FAIL][122] ([Intel XE#4330]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@blocking-wf_vblank.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][124] ([Intel XE#2882]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][126] ([Intel XE#2882]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#4330]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@blocking-wf_vblank@d-hdmi-a6.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@blocking-wf_vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#2953]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [SKIP][132] ([Intel XE#2482]) -> [PASS][133] +16 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][134] ([Intel XE#1745]) -> [PASS][135] +4 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#656]) -> [PASS][137] +7 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][138] ([Intel XE#2548]) -> [PASS][139] +45 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][140] ([Intel XE#2568]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_invalid_mode@bad-vtotal.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][142] ([Intel XE#3380]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-lnl:          [SKIP][144] ([Intel XE#2763]) -> [PASS][145] +37 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][146] ([Intel XE#870]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [SKIP][148] ([Intel XE#1129]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [SKIP][150] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][152] ([Intel XE#1489]) -> [PASS][153] +4 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [SKIP][154] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][155] +16 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][156] ([Intel XE#2939]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][158] ([Intel XE#1435]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setmode@basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_setmode@basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1392]) -> [PASS][161] +7 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [SKIP][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182]) ([Intel XE#2457]) -> ([PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][202] ([Intel XE#4173]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@xe_wedged@basic-wedged.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][204] ([Intel XE#4471]) -> [SKIP][205] ([Intel XE#664])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-lnl:          [SKIP][206] ([Intel XE#4471]) -> [DMESG-WARN][207] ([Intel XE#324])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_atomic@plane-cursor-legacy.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][208] ([Intel XE#4471]) -> [SKIP][209] ([Intel XE#1407]) +5 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][210] ([Intel XE#4471]) -> [SKIP][211] ([Intel XE#3658])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][212] ([Intel XE#4472]) -> [SKIP][213] ([Intel XE#1407]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][214] ([Intel XE#4471]) -> [SKIP][215] ([Intel XE#1124]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          [SKIP][216] ([Intel XE#4472]) -> [SKIP][217] ([Intel XE#1467])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][218] ([Intel XE#4472]) -> [SKIP][219] ([Intel XE#1428])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][220] ([Intel XE#4471]) -> [SKIP][221] ([Intel XE#1477])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][222] ([Intel XE#4472]) -> [SKIP][223] ([Intel XE#1124]) +12 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          [SKIP][224] ([Intel XE#4471]) -> [SKIP][225] ([Intel XE#2191])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          [SKIP][226] ([Intel XE#4472]) -> [SKIP][227] ([Intel XE#2191]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          [SKIP][228] ([Intel XE#4472]) -> [SKIP][229] ([Intel XE#1512])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][230] ([Intel XE#4472]) -> [SKIP][231] ([Intel XE#367])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][232] ([Intel XE#4471]) -> [SKIP][233] ([Intel XE#367]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][234] ([Intel XE#4471]) -> [SKIP][235] ([Intel XE#1512])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][237] ([Intel XE#787]) +10 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#787]) -> [SKIP][239] ([Intel XE#455] / [Intel XE#787])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][240] ([Intel XE#4471]) -> [SKIP][241] ([Intel XE#2887]) +13 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][242] ([Intel XE#4471]) -> [SKIP][243] ([Intel XE#3432])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][244] ([Intel XE#4472]) -> [SKIP][245] ([Intel XE#3432]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][246] ([Intel XE#4472]) -> [SKIP][247] ([Intel XE#2887]) +15 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#2705]) -> [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#3113])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][250] -> [INCOMPLETE][251] ([Intel XE#3113])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][252] ([Intel XE#4472]) -> [SKIP][253] ([Intel XE#4416])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          [SKIP][254] ([Intel XE#4471]) -> [SKIP][255] ([Intel XE#3278]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_content_protection@content-type-change.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#455]) -> [FAIL][257] ([Intel XE#1178])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_content_protection@legacy.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_content_protection@legacy.html
    - shard-lnl:          [SKIP][258] ([Intel XE#4472]) -> [SKIP][259] ([Intel XE#3278]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_content_protection@legacy.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][260] ([Intel XE#4471]) -> [SKIP][261] ([Intel XE#1468])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_content_protection@mei-interface.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][262] ([Intel XE#4472]) -> [SKIP][263] ([Intel XE#2321])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][264] ([Intel XE#4471]) -> [SKIP][265] ([Intel XE#2321])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          [SKIP][266] ([Intel XE#4471]) -> [SKIP][267] ([Intel XE#1424]) +5 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][268] ([Intel XE#4472]) -> [SKIP][269] ([Intel XE#1424]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][270] ([Intel XE#4472]) -> [SKIP][271] ([Intel XE#309]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][272] ([Intel XE#4471]) -> [SKIP][273] ([Intel XE#309]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          [SKIP][274] ([Intel XE#4472]) -> [SKIP][275] ([Intel XE#323]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][276] ([Intel XE#4471]) -> [SKIP][277] ([Intel XE#4302])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][278] ([Intel XE#4471]) -> [SKIP][279] ([Intel XE#4354])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][280] ([Intel XE#4472]) -> [SKIP][281] ([Intel XE#4331])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][282] ([Intel XE#4472]) -> [SKIP][283] ([Intel XE#2244])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@dsc-with-bpc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][284] ([Intel XE#4471]) -> [SKIP][285] ([Intel XE#2244]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          [SKIP][286] ([Intel XE#4472]) -> [SKIP][287] ([Intel XE#4422])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][288] ([Intel XE#301]) -> [SKIP][289] ([Intel XE#310])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][290] ([Intel XE#2955]) -> [SKIP][291] ([Intel XE#2316])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#310]) -> [DMESG-WARN][293] ([Intel XE#2955])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#3098]) -> [SKIP][295] ([Intel XE#310])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][296] ([Intel XE#2955]) -> [INCOMPLETE][297] ([Intel XE#2049] / [Intel XE#2597])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][298] ([Intel XE#1745]) -> [SKIP][299] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][300] ([Intel XE#1745]) -> [SKIP][301] ([Intel XE#1401] / [Intel XE#1745]) +9 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][302] ([Intel XE#2548]) -> [SKIP][303] ([Intel XE#651]) +27 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][304] ([Intel XE#2311]) -> [SKIP][305] ([Intel XE#2312]) +7 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][306] ([Intel XE#2312]) -> [SKIP][307] ([Intel XE#2311]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#4141]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#656]) -> [DMESG-WARN][311] ([Intel XE#4330])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][312] ([Intel XE#2548]) -> [SKIP][313] ([Intel XE#656]) +74 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][314] ([Intel XE#4141]) -> [SKIP][315] ([Intel XE#2312]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#656]) -> [SKIP][317] ([Intel XE#651]) +16 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#651]) -> [SKIP][319] ([Intel XE#656]) +13 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][320] ([Intel XE#2312]) -> [SKIP][321] ([Intel XE#2313]) +8 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#653]) -> [SKIP][323] ([Intel XE#656]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#656]) -> [SKIP][325] ([Intel XE#653]) +15 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][326] ([Intel XE#2313]) -> [SKIP][327] ([Intel XE#2312]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][328] ([Intel XE#4472]) -> [SKIP][329] ([Intel XE#3374] / [Intel XE#3544])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][330] ([Intel XE#4471]) -> [SKIP][331] ([Intel XE#1503])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][332] ([Intel XE#4472]) -> [SKIP][333] ([Intel XE#1503])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][334] ([Intel XE#2568]) -> [SKIP][335] ([Intel XE#1450] / [Intel XE#2568])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][336] ([Intel XE#3380]) -> [DMESG-FAIL][337] ([Intel XE#324])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane@plane-position-hole.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [SKIP][338] ([Intel XE#3380]) -> [DMESG-WARN][339] ([Intel XE#324])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][340] ([Intel XE#4472]) -> [SKIP][341] ([Intel XE#599])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][342] ([Intel XE#4471]) -> [SKIP][343] ([Intel XE#599])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][344] ([Intel XE#2861]) -> [FAIL][345] ([Intel XE#2029])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][346] ([Intel XE#1489]) -> [SKIP][347] ([Intel XE#2893]) +10 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          [SKIP][348] ([Intel XE#1122]) -> [SKIP][349] ([Intel XE#1128]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][350] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][351] ([Intel XE#1406]) +13 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@pr-primary-blt.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][352] ([Intel XE#4471]) -> [SKIP][353] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][354] ([Intel XE#4472]) -> [SKIP][355] ([Intel XE#3414] / [Intel XE#3904])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][356] ([Intel XE#4471]) -> [SKIP][357] ([Intel XE#1127]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1500]) -> [SKIP][359] ([Intel XE#362])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-lnl:          [SKIP][360] ([Intel XE#4472]) -> [SKIP][361] ([Intel XE#362])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          [SKIP][362] ([Intel XE#4471]) -> [SKIP][363] ([Intel XE#1499])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@lobf.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][364] ([Intel XE#4472]) -> [SKIP][365] ([Intel XE#1499])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2861
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471
  [Intel XE#4472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -> xe-pw-139954v10

  IGT_8257: 8257
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf891368b75a67e8700dc
  xe-pw-139954v10: 139954v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/index.html

--===============9098648905398380827==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev10)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v10/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139954v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67=
e8700dc_full -&gt; xe-pw-139954v10_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139954v10_full absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-139954v10_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1399=
54v10_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms@plane-68:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-9/igt@kms_pm_=
rpm@universal-planes-dpms@plane-68.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-6/igt@kms_pm_r=
pm@universal-planes-dpms@plane-68.html">DMESG-WARN</a> +2 other tests dmesg=
-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139954v10_full that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3=
767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/i=
gt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_bw@connected-linear-tili=
ng-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_bw@linear-tiling-2-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +120 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@kms_cdclk@mode-transition@=
pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe=
-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_chamelium_color@ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-433/igt@kms_content_protection@ato=
mic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_cursor_crc@cursor-offscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_crc@cursor-random=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_curso=
r_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-46=
4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-=
vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_flip@2x-flip-vs-=
modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-re=
create.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@kms_flip@basic-flip-vs-wf_=
vblank@d-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +7 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139954v10/shard-adlp-8/igt@kms_flip@flip-vs-suspend.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_flip@flip-vs-suspend-int=
erruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4330">Intel XE#4330</a>) +13 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip@flip-vs-suspend-i=
nterruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#238=
0</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v10/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16b=
pp-xtile-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 =
other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">I=
ntel XE#1401</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656=
">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_invalid_mode@clock-too-h=
igh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_joiner@bas=
ic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_plane@plane-position-hol=
e-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +12 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_plane@plane-position-hol=
e@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pi=
pe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/599">Intel XE#599</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_plane_multiple@tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_sequ=
ence@get-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_sequence@get-busy.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@kms_setmode@clo=
ne-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-432/igt@xe_=
exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_exec_basic@multigpu-once-=
null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@=
xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>=
) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
45">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-=
userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_query@multigpu-query-conf=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_sriov_auto_provisioning@s=
elfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@fbdev@re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@fbdev@read.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-f=
encing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/i=
gt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +52 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10=
/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1511">Intel XE#1511</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_color@deep-co=
lor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_colo=
r@degamma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_color@degamma.html">PASS</a> +=
18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@km=
s_cursor_crc@cursor-suspend.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-4=
34/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> +5 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/=
igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varyin=
g-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cu=
rsor-atomic-transitions-varying-size.html">PASS</a> +39 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-463/igt@kms_dp_aux_dev.html=
">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_dp_aux_dev.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-463/igt@=
kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_feature=
_discovery@psr1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_=
flip@2x-dpms-vs-vblank-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@kms_fli=
p@2x-wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@blocking-wf_vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_=
flip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_fli=
p@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-2/=
igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_=
flip@blocking-wf_vblank@b-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@blocking-wf_vblank@d-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg=
2-434/igt@kms_flip@blocking-wf_vblank@d-hdmi-a6.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-ad=
lp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE=
#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139954v10/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modes=
et-interruptible.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile=
-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/sh=
ard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PAS=
S</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_inva=
lid_mode@bad-vtotal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_invali=
d_mode@bad-vtotal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@k=
ms_plane@plane-panning-bottom-right.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#=
2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v10/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-modifiers.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_pm_b=
acklight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_pm_dc@dc5-psr.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shar=
d-lnl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139954v10/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuo=
us-exceed-fully-sf.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@=
psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_ps=
r@psr-no-drrs.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/sh=
ard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setm=
ode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_setmode@basic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard=
-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> =
+7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e87=
00dc/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a6=
7e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b=
75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891=
368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fb=
f891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca=
26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a932=
92ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26=
a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf5=
6e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-=
1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v10/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139954v10/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@xe_wedg=
ed@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-adlp-2/igt@xe_wedg=
ed@basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_asyn=
c_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms=
_async_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_atom=
ic@plane-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_ato=
mic@plane-cursor-legacy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms=
_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE=
#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139954v10/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms=
_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_=
big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_big_fb@y-=
tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/i=
gt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-l=
nl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#=
1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v=
10/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/s=
hard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/219=
1">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/s=
hard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/219=
1">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/s=
hard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/151=
2">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1=
/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@l=
inear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5=
/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@l=
inear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5=
/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-139954v10/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v10/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-ln=
l-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#28=
87</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-l=
nl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#=
3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard=
-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel=
 XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/sha=
rd-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">I=
ntel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/=
shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v1=
0/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hd=
mi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_cdclk@plan=
e-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4416">Intel XE#4416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5=
/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_co=
ntent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@k=
ms_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/i=
gt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/i=
gt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-random-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@km=
s_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1=
/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8=
/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-at=
omic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10=
/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@=
kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_=
dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/i=
gt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_dsc@dsc-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_dsc@d=
sc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v=
10/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-464/igt@k=
ms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@kms_flip=
@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg=
2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-d=
g2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#=
2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-=
linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yti=
le-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v10/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-dg2-434/igt@=
kms_frontbuffer_tracking@fbc-2p-rte.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/656">Intel XE#656</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Inte=
l XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscr=
n-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v10/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139954v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
954v10/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954=
v10/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_hdr@sta=
tic-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_inva=
lid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_in=
valid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plan=
e@plane-position-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@kms_plan=
e@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e@plane-position-hole-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms=
_plane@plane-position-hole-dpms.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plan=
e_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms_plane=
_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_plane_lo=
wres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2861">Intel XE#2861</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-5/igt@kms_pm_dc@deep-pkg=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@=
kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +10 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-3/igt@kms_psr2_su=
@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1128">Intel XE#1128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@=
pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-4/igt@kms=
_psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl=
-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"=
>Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-1/igt@k=
ms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-ln=
l-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#11=
27</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/=
shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
62">Intel XE#362</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/sh=
ard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139954v10/shard-lnl-7/igt@kms_vrr@lobf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v10/shard-lnl-8/igt@kms_vrr=
@seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -&gt; xe-pw-139=
954v10</li>
</ul>
<p>IGT_8257: 8257<br />
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf89=
1368b75a67e8700dc<br />
  xe-pw-139954v10: 139954v10</p>

</body>
</html>

--===============9098648905398380827==--
