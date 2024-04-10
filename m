Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061FCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447D11330C;
	Wed, 10 Apr 2024 12:19:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1F511330C;
 Wed, 10 Apr 2024 12:19:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0327650881791249010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Pcode_init_status_and_lmem_chec?=
 =?utf-8?q?k_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 12:19:18 -0000
Message-ID: <171275155863.1320523.7555467527713934636@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410085005.1126343-1-riana.tauro@intel.com>
In-Reply-To: <20240410085005.1126343-1-riana.tauro@intel.com>
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

--===============0327650881791249010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Pcode init status and lmem check (rev5)
URL   : https://patchwork.freedesktop.org/series/130904/
State : failure

== Summary ==

CI Bug Log - changes from xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0_full -> xe-pw-130904v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130904v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130904v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130904v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-adlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-130904v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][4] ([Intel XE#1231])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][5] ([Intel XE#616])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#619])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#346])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#650]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#1252])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +64 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#1178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#307])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#308])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1135] / [Intel XE#1201])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#310])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1151] / [Intel XE#1201])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#656]) +20 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#605])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#616])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][45] ([Intel XE#1331]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#361])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#361]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#870])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#870])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1211])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1122] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1149] / [Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#327])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#1191] / [Intel XE#1214])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1050])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1195] / [Intel XE#1473])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][71] -> [TIMEOUT][72] ([Intel XE#1259] / [Intel XE#1473] / [Intel XE#392])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_store@cachelines:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#1270])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_exec_store@cachelines.html

  * igt@xe_exec_store@page-sized:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#1270])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@xe_exec_store@page-sized.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_store@page-sized.html

  * igt@xe_exec_threads@threads-bal-fd-rebind:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1206] / [Intel XE#1356])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][81] -> [TIMEOUT][82] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][83] -> [TIMEOUT][84] ([Intel XE#1261] / [Intel XE#1356])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1192] / [Intel XE#1201])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][86] ([Intel XE#1214])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_module_load@unload.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#979])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_pm@s3-exec-after.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#944])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#944])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:
    - shard-dg2-set2:     [PASS][91] -> [DMESG-WARN][92] ([Intel XE#1214])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2-set2:     [DMESG-WARN][93] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][94] +6 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#1259]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_basic@many-execqueues-userptr:
    - shard-adlp:         [DMESG-WARN][97] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@xe_exec_basic@many-execqueues-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_basic@many-execqueues-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][100] +2 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-dg2-set2:     [INCOMPLETE][101] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - shard-adlp:         [FAIL][103] ([Intel XE#1069]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-8/igt@xe_exec_threads@threads-cm-userptr-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#1214] / [Intel XE#358]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][107] ([Intel XE#1231]) -> [DMESG-FAIL][108] ([Intel XE#324])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][110] ([Intel XE#1178])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][111] ([Intel XE#1204]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#455])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][114] ([Intel XE#1195] / [Intel XE#927])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][115] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][116] ([Intel XE#1195])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][117] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][118] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [INCOMPLETE][120] ([Intel XE#1195] / [Intel XE#927])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][121] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [INCOMPLETE][122] ([Intel XE#1195])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][124] ([Intel XE#1201]) +34 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_sequence@queue-busy:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1234])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-433/igt@kms_sequence@queue-busy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_sequence@queue-busy.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][128] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][130] ([Intel XE#1214] / [i915#10142])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][131] ([Intel XE#1259] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][132] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][133] ([Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][134] ([Intel XE#482])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - shard-adlp:         [INCOMPLETE][135] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1330]) -> [DMESG-FAIL][136] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142


Build changes
-------------

  * Linux: xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0 -> xe-pw-130904v5

  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0: e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0
  xe-pw-130904v5: 130904v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/index.html

--===============0327650881791249010==
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
<tr><td><b>Series:</b></td><td>Pcode init status and lmem check (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130904/">https://patchwork.freedesktop.org/series/130904/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0_full -&gt; xe-pw-130904v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130904v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130904v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130904v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130904v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@cachelines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_exec_store@cachelines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270">Intel XE#1270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@page-sized:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@xe_exec_store@page-sized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_store@page-sized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270">Intel XE#1270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@xe_exec_basic@many-execqueues-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_basic@many-execqueues-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-8/igt@xe_exec_threads@threads-cm-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-433/igt@kms_sequence@queue-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@kms_sequence@queue-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130904v5/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0 -&gt; xe-pw-130904v5</li>
</ul>
<p>IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1065-e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0: e8cc402d96f7f8a41fbc22ac40ad27cd444fc5f0<br />
  xe-pw-130904v5: 130904v5</p>

</body>
</html>

--===============0327650881791249010==--
