Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B16C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 08:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AD610EA12;
	Tue,  7 May 2024 08:28:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024110EA12;
 Tue,  7 May 2024 08:28:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4455293495993169760=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Rename_few_xe=5Fargs?=
 =?utf-8?q?=2Eh_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 08:28:48 -0000
Message-ID: <171507052899.1960922.16778604299711677844@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506215618.2703-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240506215618.2703-1-michal.wajdeczko@intel.com>
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

--===============4455293495993169760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename few xe_args.h macros
URL   : https://patchwork.freedesktop.org/series/133258/
State : failure

== Summary ==

CI Bug Log - changes from xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7_full -> xe-pw-133258v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133258v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133258v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133258v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  
New tests
---------

  New tests have been introduced between xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7_full and xe-pw-133258v1_full:

### New IGT tests (1) ###

  * igt@xe_exec_compute_mode:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-133258v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][2] ([Intel XE#1214] / [Intel XE#1667])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][3] ([Intel XE#1538] / [Intel XE#1717])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1201] / [Intel XE#660])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#827]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +20 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#610]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#829]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][13] ([Intel XE#1231]) +4 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +51 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#650]) +7 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +77 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +63 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#616]) +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +20 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@gamma:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201]) +42 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_color@gamma.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#309]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#323])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#701])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#310]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][37] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][38] ([Intel XE#1195])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][39] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@a-hdmi-a7.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#1608]) +4 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][43] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][44] ([Intel XE#324]) +2 other tests dmesg-fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#616]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#656]) +75 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +25 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#616]) +6 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +25 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_getfb@getfb-handle-not-fb:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#687])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb-handle-not-fb.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1341])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1339])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#1331]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][56] ([Intel XE#361]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#870])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1129] / [Intel XE#1201])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1211])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#836]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) +28 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1149] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#327]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1127] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#899]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#455]) +46 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:
    - shard-adlp:         NOTRUN -> [FAIL][75] ([Intel XE#1080]) +19 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][81] -> [TIMEOUT][82] ([Intel XE#1473])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#261]) +11 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#688]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1392]) +15 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#288]) +50 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#1562]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][89] ([Intel XE#1068])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#1638])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][91] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#379])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_noexec_ping_pong.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#979])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][94] ([Intel XE#1221])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][96] ([Intel XE#1195] / [Intel XE#1358])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][97] -> [ABORT][98] ([Intel XE#1358]) +1 other test abort
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#579])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#944]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@bind-once:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][101] ([Intel XE#1330])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_vm@bind-once.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [FAIL][102] ([Intel XE#1659]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][108] ([Intel XE#616]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][110] ([Intel XE#616]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][112] ([Intel XE#361]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - {shard-lnl}:        [DMESG-WARN][114] ([Intel XE#1595]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - {shard-lnl}:        [SKIP][116] ([Intel XE#1211]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][118] ([Intel XE#771] / [Intel XE#899]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][120] ([Intel XE#899]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#899]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#1214]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#1600]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][130] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [INCOMPLETE][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [DMESG-WARN][134] ([Intel XE#1214]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * {igt@xe_pm@s4-vm-bind-unbind-all}:
    - shard-adlp:         [ABORT][136] ([Intel XE#1794]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
    - {shard-lnl}:        [ABORT][138] ([Intel XE#1794]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) -> [DMESG-WARN][141] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][143] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#324]) -> [FAIL][145] ([Intel XE#1231])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][147] ([Intel XE#1178])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#1178]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#455])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@kms_content_protection@legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][151] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1195]) -> [DMESG-WARN][153] ([Intel XE#1214] / [Intel XE#282])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1214]) -> [INCOMPLETE][155] ([Intel XE#1195])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][156] ([Intel XE#1195]) -> [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][158] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][159] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [INCOMPLETE][160] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][161] ([Intel XE#1191] / [Intel XE#1214])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#362])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][164] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][165] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][167] ([Intel XE#1214] / [Intel XE#1608])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [INCOMPLETE][168] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][169] ([Intel XE#1191] / [Intel XE#1214])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][170] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][171] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1606
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1652
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1731
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1777
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
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
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7 -> xe-pw-133258v1

  IGT_7835: 4b767566bbc6c3ac342b54620aec0fabc8cdd4bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7: 980de4c8f9c4fc65bd51d355372e06dc576c3ea7
  xe-pw-133258v1: 133258v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/index.html

--===============4455293495993169760==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename few xe_args.h macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133258/">https://patchwork.freedesktop.org/series/133258/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7_full -&gt; xe-pw-133258v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133258v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133258v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133258v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7_full and xe-pw-133258v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_exec_compute_mode:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133258v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667">Intel XE#1667</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a7.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@a-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-not-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb-handle-not-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@xe_vm@bind-once.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-vm-bind-unbind-all}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-9/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v1/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7 -&gt; xe-pw-133258v1</li>
</ul>
<p>IGT_7835: 4b767566bbc6c3ac342b54620aec0fabc8cdd4bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1244-980de4c8f9c4fc65bd51d355372e06dc576c3ea7: 980de4c8f9c4fc65bd51d355372e06dc576c3ea7<br />
  xe-pw-133258v1: 133258v1</p>

</body>
</html>

--===============4455293495993169760==--
