Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7554DC0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 15:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893510E854;
	Thu, 23 Jan 2025 15:53:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B7410E854;
 Thu, 23 Jan 2025 15:53:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2692515777063889287=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_devcoredump_and_guc_lo?=
 =?utf-8?q?g_dump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 15:53:18 -0000
Message-ID: <173764759800.3595954.15467073602763074826@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
In-Reply-To: <20250123051112.1938193-1-lucas.demarchi@intel.com>
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

--===============2692515777063889287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix devcoredump and guc log dump
URL   : https://patchwork.freedesktop.org/series/143872/
State : failure

== Summary ==

CI Bug Log - changes from xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2_full -> xe-pw-143872v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143872v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143872v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143872v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-linear:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-linear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-linear.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  
Known issues
------------

  Here are the changes found in xe-pw-143872v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][8] ([Intel XE#3914])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3157])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#911])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#3768])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3768])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#664])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#1033])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#607])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#607])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124]) +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2191]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#367]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +45 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +68 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +174 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#2907]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][42] -> [INCOMPLETE][43] ([Intel XE#3862]) +1 other test incomplete
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#3442])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3432])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#3442])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2136] / [Intel XE#2231]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#314])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#314]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1152]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1152] / [Intel XE#455])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1152]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#306])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#306]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#373]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#373]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#373]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#3007]) +14 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_color@ctm-blue-to-red.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#455]) +36 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#307]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#1178])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#3304])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1468])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#1178])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#3007]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#308]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#308])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2321])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2320]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#309])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#323])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2291]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#309]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#323])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2425])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455]) +15 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2244]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2244])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#702])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#703])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1137])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1135])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#3321]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#301] / [Intel XE#3321])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#301]) +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#2955])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][96] ([Intel XE#1033]) +26 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#310]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_flip@2x-plain-flip.html
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#2316]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1421]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][101] -> [DMESG-WARN][102] ([Intel XE#1033]) +45 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-bmg:          [PASS][103] -> [INCOMPLETE][104] ([Intel XE#2049]) +1 other test incomplete
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip@bo-too-big-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][105] -> [FAIL][106] ([Intel XE#301])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [PASS][107] -> [FAIL][108] ([Intel XE#3321]) +2 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2293]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1397]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1401]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#352]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#651]) +28 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#651]) +24 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][119] ([Intel XE#1033]) +3 other tests dmesg-fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4141]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#656]) +58 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#651]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2311]) +15 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#656]) +30 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2312]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#653]) +22 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2313]) +12 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#653]) +23 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1158])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_getfb@getfb-handle-valid:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([i915#2575]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_getfb@getfb-handle-valid.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_getfb@getfb-handle-valid.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#605])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#1503])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1503])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([i915#2575]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#346])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#346])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2925])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2927])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#356])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2763]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2763]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2763]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#870])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#3309])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#836])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#2446])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-bmg:          [PASS][156] -> [SKIP][157] ([Intel XE#2446])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1033] / [Intel XE#2042])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#2893]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1489]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1489]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1489]) +14 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2387])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1122])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1122])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1406]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#3414]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][172] ([Intel XE#1874]) +5 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1127])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#3414])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#3414] / [Intel XE#3904])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][176] -> [SKIP][177] ([Intel XE#1435])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#330])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][179] -> [FAIL][180] ([Intel XE#899])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#1033]) +49 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][183] ([Intel XE#1033]) +9 other tests dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2168])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#756])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#756]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][187] -> [DMESG-WARN][188] ([Intel XE#2705])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@testdisplay.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@testdisplay.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#455] / [Intel XE#488])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [PASS][190] -> [ABORT][191] ([Intel XE#2625])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1447])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#1447])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#1126])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#1126])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#1062])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#3889]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#2905]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#3889]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#3889]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#3889]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#2905]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#2905]) +11 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_eudebug_online@single-step.html
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2905]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#688])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@xe_evict@evict-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][206] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#688])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#1130]) +9 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][209] -> [SKIP][210] ([Intel XE#1392]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2322]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#1392]) +14 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1392]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#288]) +34 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#288]) +19 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2360])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][217] ([Intel XE#2360])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][218] -> [SKIP][219] ([Intel XE#1192]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#2229])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#560])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#1008])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_mmap@vram.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#977])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#977])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#979])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][228] ([Intel XE#1173]) +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][229] ([Intel XE#2284] / [Intel XE#366])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#2284])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#2284] / [Intel XE#366])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#2284])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#2284] / [Intel XE#366])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#584]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][235] -> [ABORT][236] ([Intel XE#1358])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-lnl:          [PASS][237] -> [ABORT][238] ([Intel XE#1358] / [Intel XE#1607])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         NOTRUN -> [ABORT][239] ([Intel XE#1358] / [Intel XE#1607])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#1130]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][241] ([Intel XE#579])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][242] ([Intel XE#4046])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#944])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#944]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][245] ([Intel XE#944]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][246] -> [SKIP][247] ([Intel XE#1130]) +41 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_spin_batch@spin-all.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_spin_batch@spin-all.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#4130])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#3342])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#3342])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-binds-2147483648:
    - shard-dg2-set2:     [PASS][251] -> [SKIP][252] ([Intel XE#1130]) +29 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_vm@large-binds-2147483648.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_vm@large-binds-2147483648.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][253] ([Intel XE#2134]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@fbdev@eof.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][255] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][259] ([Intel XE#1033]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][261] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#367]) -> [PASS][264] +4 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-bmg:          [INCOMPLETE][265] ([Intel XE#3226]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][267] ([Intel XE#2291]) -> [PASS][268] +2 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [PASS][270] +3 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][271] ([Intel XE#3070]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [ABORT][273] ([Intel XE#1033] / [Intel XE#2625]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][275] ([Intel XE#1033]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#301]) -> [PASS][278] +7 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][279] ([Intel XE#2316]) -> [PASS][280] +7 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#1033]) -> [PASS][282] +32 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][283] ([Intel XE#886]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#687]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_getfb@getfb2-handle-zero.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_getfb@getfb2-handle-zero.html
    - shard-bmg:          [SKIP][287] -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_getfb@getfb2-handle-zero.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-bmg:          [DMESG-WARN][289] ([Intel XE#877]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [INCOMPLETE][291] -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [SKIP][293] ([Intel XE#4108]) -> [PASS][294] +7 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4108]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [DMESG-WARN][297] ([Intel XE#1033] / [Intel XE#2042]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-bmg:          [SKIP][299] ([Intel XE#780]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_prop_blob@blob-prop-validate.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_prop_blob@blob-prop-validate.html
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#780]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_prop_blob@blob-prop-validate.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][303] ([Intel XE#3007]) -> [PASS][304] +5 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [SKIP][305] ([Intel XE#829]) -> [PASS][306] +2 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#829]) -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][309] ([Intel XE#2883]) -> [PASS][310] +2 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [ABORT][311] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4057]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1392]) -> [PASS][314] +2 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][315] ([Intel XE#1130]) -> [PASS][316] +7 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][317], [PASS][318], [PASS][319], [PASS][320], [SKIP][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341]) ([Intel XE#2457]) -> ([PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-4/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][366], [PASS][367], [PASS][368], [SKIP][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378]) ([Intel XE#378]) -> ([PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-3/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-4/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-8/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-8/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-2/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-4/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-2/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-3/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [SKIP][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415]) ([Intel XE#378]) -> ([PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][441] ([Intel XE#3546]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [FAIL][443] ([Intel XE#3546]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][445] ([Intel XE#1033] / [Intel XE#1616]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][447] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][449] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][450] +1 other test pass
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_pm@s3-multiple-execs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][451] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][453] ([Intel XE#1033] / [Intel XE#2280]) -> [PASS][454] +1 other test pass
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-bmg:          [DMESG-WARN][455] ([Intel XE#1033] / [Intel XE#2280]) -> [PASS][456]
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:
    - shard-dg2-set2:     [DMESG-WARN][457] ([Intel XE#1033]) -> [PASS][458] +57 other tests pass
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html

  * igt@xe_vm@mmap-style-bind-many-all:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1130]) -> [PASS][460] +7 other tests pass
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_vm@mmap-style-bind-many-all.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_vm@mmap-style-bind-many-all.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-bmg:          [DMESG-WARN][461] ([Intel XE#1033]) -> [SKIP][462] ([Intel XE#3007]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_async_flips@test-cursor-atomic.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [SKIP][463] ([Intel XE#4108]) -> [SKIP][464] ([Intel XE#3007])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-transition-fencing.html
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#4108]) -> [SKIP][466] ([i915#2575])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][467] ([Intel XE#2327]) -> [SKIP][468] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#316]) -> [SKIP][470] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][471] ([Intel XE#1124]) -> [SKIP][472] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][473] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][474] ([Intel XE#1124]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][476] ([Intel XE#1124])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#1124])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1124]) -> [SKIP][480] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][481] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][482] ([Intel XE#3007])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2191]) -> [SKIP][484] ([i915#2575])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][485] ([Intel XE#367]) -> [SKIP][486] ([Intel XE#3007])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#367]) -> [SKIP][488] ([i915#2575])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][489] ([Intel XE#3282]) -> [SKIP][490] ([Intel XE#2887])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#829]) -> [SKIP][492] ([Intel XE#455] / [Intel XE#787])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][493] ([Intel XE#2887]) -> [SKIP][494] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][496] ([Intel XE#2136] / [Intel XE#2231])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [INCOMPLETE][497] ([Intel XE#2594]) -> [SKIP][498] ([Intel XE#3432])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][499] -> [SKIP][500] ([Intel XE#2887])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][501] ([Intel XE#2724]) -> [SKIP][502] ([Intel XE#2136] / [Intel XE#2231])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_cdclk@plane-scaling.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          [SKIP][503] ([Intel XE#2252]) -> [SKIP][504] ([Intel XE#3007]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          [SKIP][505] ([Intel XE#4108]) -> [SKIP][506] ([Intel XE#2252])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#4108]) -> [SKIP][508] ([Intel XE#373])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#373]) -> [SKIP][510] ([i915#2575]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][511] ([Intel XE#2341]) -> [FAIL][512] ([Intel XE#1178])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_content_protection@srm.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][513] ([Intel XE#1033]) -> [FAIL][514] ([Intel XE#1178]) +1 other test fail
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#455]) -> [SKIP][516] ([i915#2575])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][517] ([Intel XE#4108]) -> [SKIP][518] ([Intel XE#2320])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][519] ([Intel XE#2320]) -> [SKIP][520] ([Intel XE#3007]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][521] -> [SKIP][522] ([Intel XE#2136] / [Intel XE#2231])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][523] ([Intel XE#2374]) -> [SKIP][524] ([Intel XE#3007])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_feature_discovery@psr1.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1135]) -> [SKIP][526] ([i915#2575])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [DMESG-FAIL][527] ([Intel XE#1033]) -> [FAIL][528] ([Intel XE#3321])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][529] ([Intel XE#2049] / [Intel XE#2597]) -> [DMESG-WARN][530] ([Intel XE#2955])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][531] ([Intel XE#2049] / [Intel XE#2597]) -> [DMESG-WARN][532] ([Intel XE#1033])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#455]) -> [SKIP][534] ([Intel XE#2136] / [Intel XE#2231])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-bmg:          [SKIP][535] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][536] ([Intel XE#2136] / [Intel XE#2231])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][537] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][538] ([Intel XE#2293] / [Intel XE#2380])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#2136]) -> [SKIP][540] ([Intel XE#455])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][541] ([Intel XE#4108]) -> [SKIP][542] ([Intel XE#2293] / [Intel XE#2380])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][543] ([i915#5274]) -> [SKIP][544] ([i915#2575])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][545] ([Intel XE#2311]) -> [SKIP][546] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][547] ([Intel XE#2312]) -> [SKIP][548] ([Intel XE#2311]) +9 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][549] ([Intel XE#2311]) -> [SKIP][550] ([Intel XE#2312]) +9 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#651]) -> [SKIP][552] ([Intel XE#2136] / [Intel XE#2231]) +6 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][553] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][554] ([Intel XE#4141])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][555] ([Intel XE#4141]) -> [SKIP][556] ([Intel XE#2312]) +4 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][557] ([Intel XE#4141]) -> [SKIP][558] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][559] ([Intel XE#2312]) -> [SKIP][560] ([Intel XE#4141]) +4 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][561] ([Intel XE#4108]) -> [SKIP][562] ([Intel XE#2311]) +4 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][564] ([Intel XE#653])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][565] ([Intel XE#2313]) -> [SKIP][566] ([Intel XE#2312]) +6 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][567] ([Intel XE#4108]) -> [SKIP][568] ([Intel XE#2313]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          [SKIP][569] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][570] ([Intel XE#2313]) +2 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#2136]) -> [SKIP][572] ([Intel XE#653])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][573] ([Intel XE#2313]) -> [SKIP][574] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#653]) -> [SKIP][576] ([Intel XE#2136] / [Intel XE#2231]) +6 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
    - shard-bmg:          [SKIP][577] ([Intel XE#2312]) -> [SKIP][578] ([Intel XE#2136] / [Intel XE#2231])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][579] ([Intel XE#2312]) -> [SKIP][580] ([Intel XE#2313]) +6 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#4108]) -> [SKIP][582] ([Intel XE#653])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][583] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][584] ([Intel XE#3544])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][585] ([Intel XE#4108]) -> [SKIP][586] ([Intel XE#4090])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#4108]) -> [SKIP][588] ([Intel XE#2925])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [DMESG-FAIL][589] ([Intel XE#1033]) -> [FAIL][590] ([Intel XE#616])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][591] ([Intel XE#829]) -> [SKIP][592] ([Intel XE#2493])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#829]) -> [SKIP][594] ([Intel XE#455])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_plane_multiple@tiling-yf.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          [SKIP][595] ([Intel XE#2763]) -> [SKIP][596] ([Intel XE#3007]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][598] ([i915#2575]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#1489]) -> [SKIP][600] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][601] ([Intel XE#1489]) -> [SKIP][602] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][603] -> [SKIP][604] ([Intel XE#2387])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][605] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][606] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr@fbc-pr-primary-page-flip.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_psr@fbc-pr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#2136]) -> [SKIP][608] ([Intel XE#2850] / [Intel XE#929])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_psr@fbc-pr-primary-page-flip.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          [SKIP][609] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][610] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-bmg:          [SKIP][611] ([Intel XE#4108]) -> [SKIP][612] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr@psr-cursor-plane-move.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_psr@psr-cursor-plane-move.html
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#4108]) -> [SKIP][614] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][616] ([Intel XE#2850] / [Intel XE#929])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_psr@psr-dpms.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][618] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][619] ([Intel XE#2330]) -> [SKIP][620] ([Intel XE#3007])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#1127]) -> [SKIP][622] ([i915#2575])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [DMESG-WARN][623] ([Intel XE#1033]) -> [SKIP][624] ([i915#2575]) +2 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [DMESG-WARN][625] ([Intel XE#1033]) -> [ABORT][626] ([Intel XE#2625])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_ccs@suspend-resume.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][627] ([Intel XE#2905]) -> [SKIP][628] ([Intel XE#1130]) +3 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#2905]) -> [SKIP][630] ([Intel XE#1130]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_eudebug_online@single-step-one.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#2322])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          [SKIP][633] ([Intel XE#2322]) -> [SKIP][634] ([Intel XE#1130]) +1 other test skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1392]) -> [SKIP][636] ([Intel XE#1130])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#288]) -> [SKIP][638] ([Intel XE#1130]) +4 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][639] ([Intel XE#1999]) -> [SKIP][640] ([Intel XE#1192])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][642] ([Intel XE#1130]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][643] ([Intel XE#1358]) -> [DMESG-WARN][644] ([Intel XE#1033])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][645] ([Intel XE#1033] / [Intel XE#569]) -> [ABORT][646] ([Intel XE#1358] / [Intel XE#1794])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          [SKIP][647] ([Intel XE#1130]) -> [SKIP][648] ([Intel XE#944])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#1130]) -> [SKIP][650] ([Intel XE#944])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4108]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8206 -> IGT_8207
  * Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -> xe-pw-143872v1

  IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf834fed3dc490343d2
  xe-pw-143872v1: 143872v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/index.html

--===============2692515777063889287==
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
<tr><td><b>Series:</b></td><td>Fix devcoredump and guc log dump</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143872/">https://patchwork.freedesktop.org/series/143872/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143872v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143872v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2534-db7cf8d52a41001ea2780cf834fed3dc4=
90343d2_full -&gt; xe-pw-143872v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143872v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143872v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1438=
72v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-lin=
ear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-linear.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872=
v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-=
hdmi-a-3-linear.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_big_fb@x-til=
ed-8bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</=
a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143872v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lat=
eclose.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Inte=
l XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/=
shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp=
-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_async_flips@test-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_big_fb@x-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/i=
gt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +45 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +68 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
152">Intel XE#1152</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1152">Intel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1152">Intel XE#1152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_colo=
r@ctm-blue-to-red.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_color@ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3007">Intel XE#3007</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3007">Intel XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_flip@2x=
-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend=
-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +26 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +7 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-fb-rec=
reate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_fl=
ip@absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_flip@absolute-wf_=
vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1033">Intel XE#1033</a>) +45 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip=
@bo-too-big-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_flip@bo-too-big=
-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 ot=
her tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-=
432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +58 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +30 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-valid:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_ge=
tfb@getfb-handle-valid.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_getfb@getfb-hand=
le-valid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-3/igt@kms_hdr@invalid-metadata-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-=
force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-n=
on-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_pm_r=
pm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_pm=
_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_pm_rpm@unive=
rsal-planes-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-=
rotation.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-7/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_vbla=
nk@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/ig=
t@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_vblank@wait-forked-busy@p=
ipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +9 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@kms_writeback@writeback-chec=
k-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@testdi=
splay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143872v1/shard-dg2-463/igt@testdisplay.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#=
2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_ccs=
@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shar=
d-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram0=
1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_eudebug@basic-vm-access-p=
arameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-exte=
nded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_eudebug_online@interrupt=
-all-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +11 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-5/igt@xe_evict@evict-small-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_exec_balancer@twice-cm-p=
arallel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-lnl-6/igt@xe_pm@s3-multiple-execs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_pm@=
s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-3/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143872v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
8">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_pm@s4-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_pm_residency@cpg-basic.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4046">Intel XE#4046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_spin_=
batch@spin-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_spin_batch@spin-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_vm@=
large-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_vm@large-binds-21=
47483648.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) +29 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@fbdev@eo=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#=
2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143872v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.=
html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sha=
rd-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
872v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143872v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">=
PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_curs=
or_legacy@cursora-vs-flipa-varying-size.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/s=
hard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_cu=
rsor_legacy@short-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143872v1/shard-dg2-436/igt@kms_cursor_legacy@short-flip-befor=
e-cursor-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_fb=
con_fbt@fbc-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-43=
3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-43=
4/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/=
shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS=
</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-5/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_flip@bloc=
king-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ge=
tfb@getfb2-handle-zero.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_getf=
b@getfb2-handle-zero.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_getf=
b@getfb2-handle-zero.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_getfb@getfb2-handle-=
zero.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_plan=
e@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/s=
hard-bmg-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_pl=
ane_lowres@tiling-x.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@kms_plane_lowres@=
tiling-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel =
XE#4108</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143872v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-=
upscale-factor-0-25.html">PASS</a> +7 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Inte=
l XE#4108</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143872v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0=
-75-upscale-factor-0-25.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_pm=
_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1=
/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_prop=
_blob@blob-prop-validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_prop=
_blob@blob-prop-validate.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_pr=
op_blob@blob-prop-validate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_=
prop_blob@blob-prop-validate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_prop=
erties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/=
igt@kms_properties@connector-properties-legacy.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-bottom.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shar=
d-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS=
</a> +2 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ro=
tation_crc@multiplane-rotation-cropping-bottom.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-1/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_vb=
lank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">In=
tel XE#4057</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143872v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shar=
d-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_exec_=
basic@no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_=
exec_basic@no-exec-bindexecqueue.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-b=
mg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc4903=
43d2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc=
490343d2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fe=
d3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf8=
34fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea278=
0cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001e=
a2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41=
001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d5=
2a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7c=
f8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-=
db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14387=
2v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14387=
2v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14387=
2v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143872v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14387=
2v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14387=
2v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-ad=
lp-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d=
2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc49=
0343d2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed=
3dc490343d2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf8=
34fed3dc490343d2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea27=
80cf834fed3dc490343d2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a4100=
1ea2780cf834fed3dc490343d2/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52=
a41001ea2780cf834fed3dc490343d2/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7c=
f8d52a41001ea2780cf834fed3dc490343d2/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143872v1/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143872v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143872v1/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143872v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143872v1/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc49=
0343d2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fe=
d3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780=
cf834fed3dc490343d2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001=
ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52=
a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7=
cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
34-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc4903=
43d2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3=
dc490343d2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2780cf8=
34fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41001ea2=
780cf834fed3dc490343d2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8d52a41=
001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-db7cf8=
d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2534-=
db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-43=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3872v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143872v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43872v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143872v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143872v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/=
shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_modul=
e_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_mod=
ule_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe=
_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_pm@s2=
idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-bmg-7/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_pm@=
s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2=
-433/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_pm@s3=
-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/i=
gt@xe_pm@s3-multiple-execs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v=
1/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@xe_pm@=
s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg=
2-433/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-=
6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_clas=
s_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_pm_=
residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_pm_residency@idle-residenc=
y-on-exec@gt0-engine-drm_xe_engine_class_copy.html">PASS</a> +57 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_vm@=
mmap-style-bind-many-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@xe_v=
m@mmap-style-bind-many-all.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_asyn=
c_flips@test-cursor-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/ig=
t@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_atom=
ic_transition@plane-all-transition-fencing.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shar=
d-bmg-6/igt@kms_atomic_transition@plane-all-transition-fencing.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">In=
tel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_at=
omic_transition@plane-all-transition-fencing.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-dg2-432/igt@kms_atomic_transition@plane-all-transition-fencing.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_big_=
fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms=
_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@km=
s_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_=
fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms=
_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"=
>Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bp=
p-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt=
@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt=
@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143872v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/=
shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/ig=
t@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-43=
2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3282">Intel XE#3282</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-4=
36/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg=
-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"=
>Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/=
shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">=
Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-5/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_cham=
elium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-b=
mg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE=
#3007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_cham=
elium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/=
igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ch=
amelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-=
433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_chameli=
um_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-7/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_co=
ntent_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg=
2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/=
igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb=
-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg=
2-434/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143872v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143872v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel X=
E#4108</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143872v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_fo=
rce_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2=
-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2=
311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872=
v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offs=
cren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143872v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#=
4108</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143872v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sha=
rd-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Inte=
l XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143872v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v=
1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872=
v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +6 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1438=
72v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#41=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3872v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sha=
rd-dg2-435/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_pl=
ane_cursor@primary.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_=
plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-8/igt@kms_plane_mu=
ltiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
872v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143872v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/s=
hard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_psr2=
_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/ig=
t@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#=
2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143872v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr@=
fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bm=
g-3/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2=
850</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_ps=
r@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-436/igt@km=
s_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@kms_psr@=
fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/ig=
t@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@kms_psr@=
psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-3/igt@kms_psr@p=
sr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@kms_ps=
r@psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@kms_p=
sr@psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-433/igt@kms_=
psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_ps=
r@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-=
432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#223=
1</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-7/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-b=
mg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE=
#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-463/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard=
-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-43=
2/igt@kms_universal_plane@cursor-fb-leak.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_ccs=
@suspend-resume.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@xe_ccs@=
suspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-3/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests sk=
ip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-434/igt@xe_eud=
ebug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-432/igt@x=
e_eudebug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sh=
ard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322=
">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-8/igt@xe_exec_=
basic@multigpu-no-exec-null.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg-6/igt@xe_=
exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143872v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-d=
g2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_liv=
e_ktest@xe_mocs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-463/igt@xe_live_ktest=
@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_oa@=
closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/sha=
rd-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-432/igt@xe_pm@=
s2idle-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-435/igt@xe_p=
m@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-dg2-=
432/igt@xe_pm@s3-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-bmg-1/igt@xe_query=
@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-bmg=
-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944<=
/a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2/shard-dg2-435/igt@xe_que=
ry@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143872v1/shard-d=
g2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#=
944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8206 -&gt; IGT_8207</li>
<li>Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -&gt; xe-pw-143=
872v1</li>
</ul>
<p>IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf=
834fed3dc490343d2<br />
  xe-pw-143872v1: 143872v1</p>

</body>
</html>

--===============2692515777063889287==--
