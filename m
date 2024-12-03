Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E40E74AC3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 18:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179B310E3BC;
	Tue,  3 Dec 2024 18:42:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF48E10E3BC;
 Tue,  3 Dec 2024 18:41:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3514267704038190966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/display=3A_fix_ttm?=
 =?utf-8?q?=5Fbo=5Faccess=28=29_usage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 18:41:58 -0000
Message-ID: <173325131870.2095567.3088053694869466842@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202170102.88893-2-matthew.auld@intel.com>
In-Reply-To: <20241202170102.88893-2-matthew.auld@intel.com>
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

--===============3514267704038190966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: fix ttm_bo_access() usage (rev3)
URL   : https://patchwork.freedesktop.org/series/141996/
State : failure

== Summary ==

CI Bug Log - changes from xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219_full -> xe-pw-141996v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141996v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141996v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141996v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4-rc-ccs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4-rc-ccs.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_vm@userptr-invalid:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_vm@userptr-invalid.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_vm@userptr-invalid.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][5] ([Intel XE#3468]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  
Known issues
------------

  Here are the changes found in xe-pw-141996v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][9] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#3557])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#3007]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#607])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#610])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#1727] / [Intel XE#3468]) +7 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-bmg:          [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#3468] / [Intel XE#877])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][22] ([Intel XE#324]) +3 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +12 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2328])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#610])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#619])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#2191]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#367]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#367]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +53 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +18 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#2907])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][37] ([Intel XE#3468]) +19 other tests dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#787]) +80 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_cdclk@mode-transition.html
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2724])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#314]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2325]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#373]) +14 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#1178])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#307])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][50] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2341])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2320]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#309]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#323]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][57] ([Intel XE#877])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2291]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2323])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2244]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#776])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#776])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2372])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#701])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#702])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_feature_discovery@display-2x.html
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2373])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1138])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1138])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2374])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#2882]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#3321]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2316])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#310]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][76] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][77] ([Intel XE#2705] / [Intel XE#3468])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][78] -> [DMESG-FAIL][79] ([Intel XE#3468]) +9 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#2333]) +8 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1151])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#651]) +23 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2311]) +31 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2312]) +17 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2352])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +34 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#656]) +57 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#653]) +14 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#2925])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2934])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2927])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#3012])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [ABORT][97] ([Intel XE#3673]) +2 other tests abort
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][98] -> [INCOMPLETE][99] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-3-size-64:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][100] ([Intel XE#3468]) +85 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_plane_cursor@primary@pipe-c-hdmi-a-3-size-64.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2393])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2493])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#2763]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#870]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#870]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2391])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#734])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
    - shard-bmg:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-bmg:          [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1727] / [Intel XE#3468])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_pm_rpm@cursor-dpms.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#836]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1489]) +10 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1489]) +10 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2414])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2939]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#3414]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#3414]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][123] ([Intel XE#1874]) +2 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#3007]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1435])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#362])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2426])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2168])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#455]) +32 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1499])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#756])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#756])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1091] / [Intel XE#2849])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][135] -> [INCOMPLETE][136] ([Intel XE#2771])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1447])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1123])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1126]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [PASS][140] -> [DMESG-WARN][141] ([Intel XE#3468]) +73 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2905]) +13 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#2905]) +16 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][144] ([Intel XE#1473])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#261] / [Intel XE#688]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#688]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [PASS][147] -> [SKIP][148] ([Intel XE#1130]) +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2322]) +12 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1392]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#288]) +34 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1130]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-bmg:          [PASS][153] -> [DMESG-WARN][154] ([Intel XE#1727]) +2 other tests dmesg-warn
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2360])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][156] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][157] ([Intel XE#3467]) +2 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2229]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2229])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#512])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#586])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#3573]) +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][163] ([Intel XE#2514]) +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1420])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#979])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2427])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#1948])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][168] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2284]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][170] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][171] -> [ABORT][172] ([Intel XE#1794])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#579])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#579])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#944]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#944]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-WARN][177] ([Intel XE#3468]) -> [PASS][178] +18 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][179] ([Intel XE#3052]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][181] ([Intel XE#1874]) -> [PASS][182] +3 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [DMESG-FAIL][183] ([Intel XE#3468]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][185] ([Intel XE#2291]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][187] ([Intel XE#2316]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][189] ([Intel XE#2882]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][195] ([Intel XE#324]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][197] ([Intel XE#1861]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [DMESG-WARN][199] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][200] +2 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#3086]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][203] ([Intel XE#3467]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][205] ([Intel XE#1192]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_live_ktest@xe_bo.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][207] ([Intel XE#1192]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [SKIP][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234]) ([Intel XE#2457]) -> ([PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [SKIP][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285]) ([Intel XE#378]) -> ([PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-1/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_module_load@load.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][311] ([Intel XE#3086] / [Intel XE#569]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_pm@s3-basic.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_pm@s3-basic.html
    - shard-bmg:          [DMESG-WARN][313] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][314] +1 other test pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@xe_pm@s3-basic.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_pm@s3-basic.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - shard-bmg:          [DMESG-WARN][315] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_vm@large-userptr-misaligned-binds-33554432.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  * igt@xe_vm@munmap-style-unbind-either-side-full:
    - shard-bmg:          [DMESG-WARN][317] ([Intel XE#1727]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_vm@munmap-style-unbind-either-side-full.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-full.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][319] ([Intel XE#2919]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_wedged@basic-wedged.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-FAIL][321] ([Intel XE#3468]) -> [DMESG-WARN][322] ([Intel XE#3468])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][323] ([Intel XE#367]) -> [SKIP][324] ([Intel XE#3007])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][325] ([Intel XE#2887]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2231])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][327] ([Intel XE#2341]) -> [FAIL][328] ([Intel XE#1178])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_content_protection@atomic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][329] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][330] ([Intel XE#1178]) +1 other test fail
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [FAIL][331] ([Intel XE#1178]) -> [INCOMPLETE][332] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          [SKIP][333] ([Intel XE#2320]) -> [SKIP][334] ([Intel XE#3007])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][335] ([Intel XE#3468]) -> [INCOMPLETE][336] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][337] ([Intel XE#877]) -> [SKIP][338] ([Intel XE#2291])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [FAIL][339] ([Intel XE#2141]) -> [DMESG-FAIL][340] ([Intel XE#3468]) +2 other tests dmesg-fail
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][341] ([Intel XE#2244]) -> [SKIP][342] ([Intel XE#2136] / [Intel XE#2231])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [DMESG-FAIL][343] ([Intel XE#3468]) -> [FAIL][344] ([Intel XE#1695])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][345] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2231])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][347] ([Intel XE#2311]) -> [SKIP][348] ([Intel XE#2312]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][349] ([Intel XE#2312]) -> [SKIP][350] ([Intel XE#2311]) +9 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [FAIL][351] ([Intel XE#2333]) -> [INCOMPLETE][352] ([Intel XE#3468])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][353] ([Intel XE#2312]) -> [FAIL][354] ([Intel XE#2333]) +3 other tests fail
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][355] ([Intel XE#2333]) -> [SKIP][356] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][357] ([Intel XE#3468]) -> [FAIL][358] ([Intel XE#2333]) +2 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][359] ([Intel XE#3468]) -> [INCOMPLETE][360] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][361] ([Intel XE#2333]) -> [SKIP][362] ([Intel XE#2312]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [FAIL][363] ([Intel XE#2333]) -> [DMESG-FAIL][364] ([Intel XE#3468]) +6 other tests dmesg-fail
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-bmg:          [SKIP][365] ([Intel XE#2311]) -> [SKIP][366] ([Intel XE#2136] / [Intel XE#2231])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][367] ([Intel XE#2313]) -> [SKIP][368] ([Intel XE#2136] / [Intel XE#2231])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][369] ([Intel XE#2312]) -> [SKIP][370] ([Intel XE#2313]) +9 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][371] ([Intel XE#2313]) -> [SKIP][372] ([Intel XE#2312]) +6 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-bmg:          [SKIP][373] ([Intel XE#2763]) -> [SKIP][374] ([Intel XE#3007])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][375] ([Intel XE#2938]) -> [SKIP][376] ([Intel XE#2136] / [Intel XE#2231])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][377] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][378] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][379] ([Intel XE#3673]) -> [ABORT][380] ([Intel XE#3468] / [Intel XE#3673]) +2 other tests abort
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][381] ([Intel XE#1473]) -> [INCOMPLETE][382] ([Intel XE#1473] / [Intel XE#3468])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][383] ([Intel XE#2322]) -> [SKIP][384] ([Intel XE#1130])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [INCOMPLETE][385] ([Intel XE#3468]) -> [DMESG-WARN][386] ([Intel XE#1727] / [Intel XE#3468])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_pm@d3hot-mmap-vram.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-basic:
    - shard-bmg:          [ABORT][387] ([Intel XE#3468] / [Intel XE#3673]) -> [ABORT][388] ([Intel XE#3673])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_pm@s2idle-basic.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [ABORT][389] ([Intel XE#1616]) -> [ABORT][390] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [ABORT][391] ([Intel XE#1616] / [Intel XE#3468]) -> [ABORT][392] ([Intel XE#1616])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_pm@s2idle-multiple-execs.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [ABORT][393] ([Intel XE#1616]) -> [ABORT][394] ([Intel XE#1616] / [Intel XE#3468])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][395] ([Intel XE#2919]) -> [SKIP][396] ([Intel XE#1130])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_wedged@basic-wedged.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][397] ([Intel XE#3467]) -> [DMESG-WARN][398] ([Intel XE#3467] / [Intel XE#3468])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3557
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8135 -> IGT_8136
  * Linux: xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219 -> xe-pw-141996v3

  IGT_8135: c6840f5e3c3b942aa79727ee4978a5b79f290b67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf12589054127d60b1d36d56ba219
  xe-pw-141996v3: 141996v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/index.html

--===============3514267704038190966==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: fix ttm_bo_access() usage (r=
ev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141996/">https://patchwork.freedesktop.org/series/141996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141996v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2310-5779fb3c12faf12589054127d60b1d36d=
56ba219_full -&gt; xe-pw-141996v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141996v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-141996v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1419=
96v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-t=
iling@pipe-d-hdmi-a-3-x-to-4-rc-ccs.html">DMESG-WARN</a> +2 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@userptr-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_vm@us=
erptr-invalid.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_vm@userptr-invalid.html">DME=
SG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141996v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-render.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141996v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@core_hot=
unplug@hotunbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@core_hotunplug@hotunb=
ind-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_async_flips@crc.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-hd=
mi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3557">Intel XE#3557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_atom=
ic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/=
igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Inte=
l XE#3007</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/i=
gt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_big_=
fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_big_fb@linear-32=
bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other te=
sts dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_bw@linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +53 other tests skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +19 other tests=
 dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +80 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_cdclk@mode-transition@pi=
pe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_chamelium_frames@dp-crc-=
multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-=
vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests =
skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-=
flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_display_modes@mst-extende=
d-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_flip@flip-vs-panning-inte=
rruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 o=
ther tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#22=
31</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +8 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +57 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-r=
ead-crc@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +2 other tests abort<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-3-size-64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_plane_cursor@primary@pipe=
-c-hdmi-a-3-size-64.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +85 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_pm_d=
c@dc9-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_pm_dc@dc9-dpms.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_pm_r=
pm@cursor-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_pm_rpm@cursor-dpms.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@kms_rotation_crc@multiplane-=
rotation.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3007">Intel XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@kms_writeback@writeback-pixe=
l-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_ccs@s=
uspend-resume@xmajor-compressed-compfmt0-system-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-=
bmg-7/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2771">Intel XE#2771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_drm_f=
dinfo@utilization-single-full-load-isolation.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/ig=
t@xe_drm_fdinfo@utilization-single-full-load-isolation.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +73 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-l=
arge.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_evict@evict-small-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_exec_=
basic@many-execqueues-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec=
_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_exec_fault_mode@many-exec=
queues-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec_fault_mode@many-execq=
ueues-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_exec_=
fault_mode@many-invalid-userptr-fault.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_exec=
_fault_mode@many-invalid-userptr-fault.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_bo_ev=
ict_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@rcs=
-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_pm@d3hot-mocs.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.=
html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#30=
52</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1996v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-a=
sync-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/=
shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_curs=
or_crc@cursor-onscreen-256x256.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-=
6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip=
@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg=
-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel=
 XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@kms_flip_scaled_cr=
c@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Int=
el XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141996v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bp=
p-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#186=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
996v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-d=
raw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_vbla=
nk@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/=
shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE=
#3086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-141996v3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wa_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3=
467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_pr=
epare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_live=
_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_live_ktest@xe_=
bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_live_ktest@=
xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56b=
a219/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36=
d56ba219/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b=
1d36d56ba219/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127=
d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf1258905=
4127d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf125=
89054127d60b1d36d56ba219/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12fa=
f12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c=
12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779=
fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-=
5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba21=
9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba21=
9/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d5=
6ba219/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1=
d36d56ba219/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127=
d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf125890=
54127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf1=
2589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c1=
2faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779=
fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310=
-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba21=
9/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1d36d5=
6ba219/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127d60b1=
d36d56ba219/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf12589054127=
d60b1d36d56ba219/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf125890=
54127d60b1d36d56ba219/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2310-5779fb3c12faf1=
2589054127d60b1d36d56ba219/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141996v3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-a=
dlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-141996v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/sh=
ard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141996v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996=
v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141996v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shar=
d-adlp-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_pm@s=
3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3086">Intel XE#3086</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-8/igt@xe_p=
m@s3-basic.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-3/igt@xe_pm@s3=
-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bm=
g-5/igt@xe_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@xe_vm@la=
rge-userptr-misaligned-binds-33554432.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141996v3/shard-bmg-3/igt@xe_vm@large-userptr-misaligned-binds-33554432.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_vm@mu=
nmap-style-unbind-either-side-full.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-=
bmg-6/igt@xe_vm@munmap-style-unbind-either-side-full.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-adlp-8/igt@xe_wedg=
ed@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-adlp-4/igt@xe_wedge=
d@basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_ccs@=
crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/s=
hard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141996v3/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg=
-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel =
XE#2715</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_curs=
or_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/=
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@kms_curs=
or_crc@cursor-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms=
_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141996v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@km=
s_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 ot=
her tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_fbco=
n_fbt@fbc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@kms_fbcon_fbt@f=
bc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141996v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftil=
e-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v=
3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-rte.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-1/igt@kms=
_frontbuffer_tracking@fbc-1p-rte.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3=
/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141996v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgf=
lip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-rgb565-draw-blt.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-=
2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#=
2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
996v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1996v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41996v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@kms_plan=
e_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1419=
96v3/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rot=
ation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-=
bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel =
XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#=
3673</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141996v3/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-s=
ystem-vram01.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +2 other tests abo=
rt</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shar=
d-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">In=
tel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
2">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues=
-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-2/igt@xe_pm@d3=
hot-mmap-vram.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-3/igt@xe_pm@d3hot=
-mmap-vram.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-7/igt@xe_pm@s2=
idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/igt@xe_pm=
@s2idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_pm@s2=
idle-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_pm@s2idle-b=
asic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-1/igt@xe_pm@s2=
idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-2/=
igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-4/igt@xe_pm@s2=
idle-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-8/igt@xe_pm@s2=
idle-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-4/igt@xe_wedged@=
basic-wedged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219/shard-bmg-6/igt@xe_wedge=
d@wedged-mode-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v3/shard-bmg-6/igt@xe_w=
edged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8135 -&gt; IGT_8136</li>
<li>Linux: xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219 -&gt; xe-pw-141=
996v3</li>
</ul>
<p>IGT_8135: c6840f5e3c3b942aa79727ee4978a5b79f290b67 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf1258905412=
7d60b1d36d56ba219<br />
  xe-pw-141996v3: 141996v3</p>

</body>
</html>

--===============3514267704038190966==--
