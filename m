Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B65C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1E10ED0D;
	Mon, 27 May 2024 14:20:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298BE10FB13;
 Mon, 27 May 2024 14:20:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4215358407134998262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_OA_functionality_to_Xe_=28r?=
 =?utf-8?q?ev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 14:20:39 -0000
Message-ID: <171681963915.2213622.12731520839565027783@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240527014333.603914-1-ashutosh.dixit@intel.com>
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

--===============4215358407134998262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add OA functionality to Xe (rev15)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

CI Bug Log - changes from xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_full -> xe-pw-121084v15_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-121084v15_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-121084v15_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-121084v15_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - {shard-lnl}:        [DMESG-WARN][2] ([Intel XE#1725]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - {shard-lnl}:        [SKIP][4] ([Intel XE#656]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - {shard-lnl}:        [ABORT][7] ([Intel XE#1939]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-59.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-6/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@xe_pm@d3cold-mmap-vram:
    - {shard-lnl}:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html

  
Known issues
------------

  Here are the changes found in xe-pw-121084v15_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1033] / [Intel XE#1214])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1388]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1204])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][17] ([Intel XE#1231]) +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +20 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][38] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][39] ([Intel XE#282]) +2 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#323])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#282])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#323])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1137] / [Intel XE#1201])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][53] ([Intel XE#1162] / [Intel XE#1214]) +4 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][54] -> [ABORT][55] ([Intel XE#1939])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][56] ([Intel XE#324]) +1 other test dmesg-fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) +18 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#653]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#656]) +44 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][66] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#616]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][69] ([Intel XE#361]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1129] / [Intel XE#1201])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#1211])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#929]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1122] / [Intel XE#1201])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][79] ([Intel XE#1874]) +13 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1127] / [Intel XE#1201])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#327])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#362])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#771] / [Intel XE#899])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][84] ([Intel XE#899])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2-set2:     NOTRUN -> [ABORT][85] ([Intel XE#1939]) +3 other tests abort
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#1939])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [ABORT][89] ([Intel XE#1939])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#756])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1091] / [Intel XE#1201])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1123] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1123] / [Intel XE#1201])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1126] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][95] -> [TIMEOUT][96] ([Intel XE#1473] / [Intel XE#392])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][97] ([Intel XE#1473] / [Intel XE#392])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][98] ([Intel XE#1195] / [Intel XE#1473])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#1392]) +9 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#288]) +25 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#288])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][105] ([Intel XE#1214] / [Intel XE#1638])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
    - shard-adlp:         NOTRUN -> [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#1638])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1192] / [Intel XE#1201])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1008] / [Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#1337])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][111] ([Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][112] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][113] -> [DMESG-WARN][114] ([Intel XE#1214])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#944])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#944])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][118] ([Intel XE#827]) -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][120] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - {shard-lnl}:        [ABORT][122] ([Intel XE#1908] / [Intel XE#1939]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - {shard-lnl}:        [FAIL][126] ([Intel XE#480] / [Intel XE#886]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - {shard-lnl}:        [FAIL][128] ([Intel XE#886]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - {shard-lnl}:        [ABORT][130] ([Intel XE#1939]) -> [PASS][131] +5 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - {shard-lnl}:        [INCOMPLETE][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [ABORT][134] ([Intel XE#1939]) -> [PASS][135] +3 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     [ABORT][136] -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-59.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1214]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-68.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][140] ([Intel XE#1939]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         [INCOMPLETE][142] ([Intel XE#1195] / [Intel XE#1939]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-dg2-set2:     [ABORT][144] ([Intel XE#1908] / [Intel XE#1939]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#1081]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - {shard-lnl}:        [ABORT][148] ([Intel XE#1553]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - {shard-lnl}:        [ABORT][150] -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:
    - {shard-lnl}:        [DMESG-FAIL][152] -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#1214]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][157] ([Intel XE#316])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#316]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1124]) -> [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][163] ([Intel XE#1124]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#619]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#619]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#787]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][169] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][170] -> [INCOMPLETE][171] ([Intel XE#1195]) +1 other test incomplete
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#787]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#1252]) -> [ABORT][177] ([Intel XE#1939])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][179] ([Intel XE#373]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#373]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][183] ([Intel XE#308])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][184] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][185] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][186] ([Intel XE#1195]) -> [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2-set2:     [DMESG-WARN][188] ([Intel XE#282]) -> [DMESG-WARN][189] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][191] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][192] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][193] ([Intel XE#282])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#307]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#307])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#455]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][199] ([Intel XE#455]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][201] ([Intel XE#651]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#651]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#653]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][207] ([Intel XE#653]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#498]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][213] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][215] ([Intel XE#498]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][217] ([Intel XE#870])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][218] ([Intel XE#1204]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#734])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][221] ([Intel XE#929]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#929]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#1729]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#362])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [INCOMPLETE][226] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][227] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][228] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][229] ([Intel XE#1191] / [Intel XE#1214])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#756]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#756])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][233] ([Intel XE#756])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1126]) -> [SKIP][235] ([Intel XE#1126] / [Intel XE#1201])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][237] ([Intel XE#288]) +7 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#288]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1192]) -> [SKIP][241] ([Intel XE#1192] / [Intel XE#1201])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][243] ([Intel XE#977])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][245] ([Intel XE#366])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
    - shard-adlp:         [SKIP][246] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][247] ([Intel XE#1201])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][248] ([Intel XE#1201] / [Intel XE#1948]) -> [SKIP][249] ([Intel XE#1201])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][250] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][251] ([Intel XE#1191] / [Intel XE#1214])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][252] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][253] ([Intel XE#1195] / [Intel XE#1694])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [ABORT][254] ([Intel XE#1191] / [Intel XE#1358] / [Intel XE#1939]) -> [INCOMPLETE][255] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@s3-basic-exec.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1162] / [Intel XE#1941]) -> [DMESG-WARN][257] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
    - shard-adlp:         [INCOMPLETE][258] ([Intel XE#1195]) -> [DMESG-WARN][259] ([Intel XE#1214] / [Intel XE#1941])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#944]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#944])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-adlp:         [SKIP][262] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][263] ([Intel XE#1201])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][265] ([Intel XE#1201])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][266] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][267] ([Intel XE#1214] / [Intel XE#1760])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f -> xe-pw-121084v15

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f
  xe-pw-121084v15: 121084v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/index.html

--===============4215358407134998262==
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
<tr><td><b>Series:</b></td><td>Add OA functionality to Xe (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121084/">https://patchwork.freedesktop.org/series/121084/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_full -&gt; xe-pw-121084v15_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-121084v15_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-121084v15_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-121084v15_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-59.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-6/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121084v15_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-434/igt@kms_vblank@query-forked-hang.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vrr@flip-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-59.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-436/igt@kms_pm_rpm@universal-planes@plane-68.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-lnl-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-9/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v15/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f -&gt; xe-pw-121084v15</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f<br />
  xe-pw-121084v15: 121084v15</p>

</body>
</html>

--===============4215358407134998262==--
