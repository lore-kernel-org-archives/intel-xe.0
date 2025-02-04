Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2041C02192
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 02:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E63710E5B8;
	Tue,  4 Feb 2025 02:38:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DC110E5B8;
 Tue,  4 Feb 2025 02:38:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5779316672980346877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pxp=3A_Fail_the_loa?=
 =?utf-8?q?d_if_PXP_fails_to_initialize?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 02:38:07 -0000
Message-ID: <173863668722.590587.14526604922638663145@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
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

--===============5779316672980346877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pxp: Fail the load if PXP fails to initialize
URL   : https://patchwork.freedesktop.org/series/144280/
State : failure

== Summary ==

CI Bug Log - changes from xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699_full -> xe-pw-144280v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144280v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144280v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144280v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html

  
New tests
---------

  New tests have been introduced between xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699_full and xe-pw-144280v1_full:

### New IGT tests (1) ###

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  

Known issues
------------

  Here are the changes found in xe-pw-144280v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4] ([Intel XE#1033]) +4 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#1033]) +2 other tests dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@kms_async_flips@crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-4/igt@kms_async_flips@crc.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][13] ([Intel XE#4172]) +10 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2907])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +79 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1152]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#306])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#308])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#309]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([i915#3804])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2373])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#702])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#310]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#310])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2316])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#3321]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#301]) +6 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#301] / [Intel XE#3321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#3321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#886]) +5 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293] / [Intel XE#2380])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401] / [Intel XE#1745])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1401])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#656]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#656]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4141])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#1033])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +12 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#653]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2925]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2763]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1489]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2234] / [Intel XE#2850])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1406])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#3414])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1127]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#2159]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1499])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2905]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#1392]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#288]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2360])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#4172]) +3 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][77] ([Intel XE#3876])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#1192])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103]) -> ([PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [SKIP][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129]) ([Intel XE#378])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1337])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2284])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#4172] / [Intel XE#569])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_pm@s3-mocs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [ABORT][135] ([Intel XE#1358] / [Intel XE#1607])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_pm@s4-vm-bind-prefetch.html
    - shard-dg2-set2:     NOTRUN -> [ABORT][136] ([Intel XE#1033] / [Intel XE#1358])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1033]) -> [PASS][139] +5 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#1033]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-8/igt@kms_async_flips@invalid-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][142] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-bmg:          [DMESG-WARN][144] ([Intel XE#877]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-6/igt@kms_color@ctm-red-to-blue.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-6/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [SKIP][146] ([Intel XE#2291]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#309]) -> [PASS][149] +2 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     [FAIL][150] ([Intel XE#2882]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#886]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [FAIL][154] ([Intel XE#2882]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#310]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][158] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#301]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][162] ([Intel XE#3321]) -> [PASS][163] +2 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-lnl:          [FAIL][166] ([Intel XE#886]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-adlp:         [DMESG-WARN][168] -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#656]) -> [PASS][171] +3 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#455]) -> [PASS][173] +3 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-dg2-set2:     [INCOMPLETE][174] -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][176] ([Intel XE#4173]) -> [PASS][177] +7 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-dg2-set2:     [DMESG-WARN][178] -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_rotation_crc@cursor-rotation-180.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_rotation_crc@cursor-rotation-180.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1392]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#4172]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][184] ([Intel XE#1192]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][186] ([Intel XE#1358]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#2953]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_pm@s3-mocs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][192] ([Intel XE#1033]) -> [FAIL][193] ([Intel XE#3884])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#787]) -> [SKIP][195] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][197] ([Intel XE#787]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][198] ([Intel XE#1178]) -> [SKIP][199] ([Intel XE#455])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][200] ([Intel XE#2316]) -> [DMESG-WARN][201] ([Intel XE#4172])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][202] ([Intel XE#3321]) -> [DMESG-FAIL][203] ([Intel XE#4172])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#1033]) -> [DMESG-FAIL][205] ([Intel XE#1033])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][206] ([Intel XE#3321]) -> [SKIP][207] ([Intel XE#2316])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][208] ([Intel XE#2311]) -> [SKIP][209] ([Intel XE#2312]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][210] ([Intel XE#2312]) -> [SKIP][211] ([Intel XE#2311]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#651]) -> [SKIP][213] ([Intel XE#656]) +10 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#4141]) -> [SKIP][215] ([Intel XE#2312]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][216] ([Intel XE#2312]) -> [SKIP][217] ([Intel XE#4141]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#656]) -> [SKIP][219] ([Intel XE#651]) +4 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#656]) -> [SKIP][221] ([Intel XE#653]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][222] ([Intel XE#2312]) -> [SKIP][223] ([Intel XE#2313]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#653]) -> [SKIP][225] ([Intel XE#656]) +9 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][226] ([Intel XE#2313]) -> [SKIP][227] ([Intel XE#2312]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][228] ([Intel XE#3544]) -> [SKIP][229] ([Intel XE#3374] / [Intel XE#3544])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][230] ([Intel XE#1033]) -> [DMESG-WARN][231] ([Intel XE#1033] / [Intel XE#4113])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][232] ([Intel XE#1729]) -> [SKIP][233] ([Intel XE#362])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][234] ([Intel XE#2426]) -> [SKIP][235] ([Intel XE#2509])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [INCOMPLETE][236] -> [FAIL][237] ([Intel XE#1522]) +1 other test fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0:
    - shard-bmg:          [INCOMPLETE][238] -> [DMESG-WARN][239] ([Intel XE#4172]) +1 other test dmesg-warn
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][240] ([Intel XE#1192]) -> [SKIP][241] ([Intel XE#2833])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#1033] / [Intel XE#569]) -> [ABORT][243] ([Intel XE#1033] / [Intel XE#1358] / [Intel XE#1794])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699 -> xe-pw-144280v1

  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699: dcbdd4e000b5256475341a71dc7ad4d95bbd9699
  xe-pw-144280v1: 144280v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/index.html

--===============5779316672980346877==
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
<tr><td><b>Series:</b></td><td>drm/xe/pxp: Fail the load if PXP fails to in=
itialize</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144280/">https://patchwork.freedesktop.org/series/144280/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144280v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144280v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2589-dcbdd4e000b5256475341a71dc7ad4d95=
bbd9699_full -&gt; xe-pw-144280v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144280v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144280v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1442=
80v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_joiner@basi=
c-force-big-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_plane_lowres@tiling-4@p=
ipe-a-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2589-dcbdd4e000b5256475341a71d=
c7ad4d95bbd9699_full and xe-pw-144280v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a=
-6:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144280v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_async_flips@async-flip-=
suspend-resume@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@kms_asy=
nc_flips@crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144280v1/shard-adlp-4/igt@kms_async_flips@crc.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +10 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +79 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rando=
m-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-v=
s-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_feature_discovery@displ=
ay-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_fl=
ip@2x-blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_flip@=
2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vbla=
nk@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-5/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-1/ig=
t@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@k=
ms_frontbuffer_tracking@fbc-rgb565-draw-render.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_lowres@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144280v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_ex=
ec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_fault_mode@once-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1=
/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_cl=
ass_render0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_threads@threads-han=
g-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95b=
bd9699/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7a=
d4d95bbd9699/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341=
a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256=
475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e00=
0b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcb=
dd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
89-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd=
9699/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71dc7ad4=
d95bbd9699/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475341a71=
dc7ad4d95bbd9699/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5256475=
341a71dc7ad4d95bbd9699/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4e000b5=
256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-dcbdd4=
e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2589-=
dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg=
2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144280v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v=
1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
80v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_module_load@load.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shar=
d-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144280v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
280v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144280v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/sha=
rd-dg2-436/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_pm@s3=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144280v1/shard-bmg-2/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#=
4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
69">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_pm@s4-vm-bind-prefetch.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_query@multigpu-query-inv=
alid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144280v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe=
-d-hdmi-a-6.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-6/=
igt@kms_async_flips@invalid-async-flip.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144280v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-6/igt@kms_colo=
r@ctm-red-to-blue.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-6/igt@kms_color=
@ctm-red-to-blue.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/s=
hard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432=
/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_fl=
ip@2x-plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-432/igt@kms=
_flip@2x-plain-flip-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_fl=
ip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg=
2-432/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a2-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_fl=
ip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-=
466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436=
/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-1/igt@k=
ms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
80v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-5/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shar=
d-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-2/igt@kms_fli=
p@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-2/igt@kms=
_flip@wf_vblank-ts-check-interruptible.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280=
v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-=
blt.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-434/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-463/igt@kms_pi=
pe_crc_basic@disable-crc-after-crtc.html">INCOMPLETE</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-435/igt@k=
ms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/sha=
rd-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +=
7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-436/igt@kms_ro=
tation_crc@cursor-rotation-180.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-436/igt@kms_ro=
tation_crc@cursor-rotation-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_exec_basic@multigpu-ma=
ny-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@xe_exec_=
threads@threads-hang-fd-userptr.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg=
-1/igt@xe_exec_threads@threads-hang-fd-userptr.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@xe_live_=
ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_live_ktest@xe_=
mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@xe_pm@=
s2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@xe_pm@=
s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-adlp-4/i=
gt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@xe_pm@=
s3-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-463/igt@xe_=
pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-adlp-8/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard=
-adlp-9/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3=
884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280=
v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144280v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_flip=
@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg=
-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel =
XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-2/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-46=
3/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-=
bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144280v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
80v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44280v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
80v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4280v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4280v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144280v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44280v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
80v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-5/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@kms_pl=
ane_lowres@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-466/igt@kms=
_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4113">Intel XE#4113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-464/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-lnl-1/igt@kms_vrr@=
flip-basic-fastset.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-lnl-5/igt@kms_vrr@flip-basic-f=
astset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-8/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44280v1/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_en=
gine_class_compute0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-bmg-2/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-bmg-8/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699/shard-dg2-464/igt@xe_pm@=
s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144280v1/shard-dg2-4=
32/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel=
 XE#1794</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699 -&gt; xe-pw-144=
280v1</li>
</ul>
<p>IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2589-dcbdd4e000b5256475341a71dc7ad4d95bbd9699: dcbdd4e000b5256475341a7=
1dc7ad4d95bbd9699<br />
  xe-pw-144280v1: 144280v1</p>

</body>
</html>

--===============5779316672980346877==--
