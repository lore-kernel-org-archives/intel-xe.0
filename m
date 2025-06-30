Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC04C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 09:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E2710E3DF;
	Mon, 30 Jun 2025 09:46:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE110E3DF;
 Mon, 30 Jun 2025 09:46:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2423292190123434597=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_drop_a?=
 =?utf-8?q?_number_of_dependencies_on_i915=5Fdrv=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 09:46:43 -0000
Message-ID: <175127680336.119497.4839776097259281179@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626101636.1896365-1-jani.nikula@intel.com>
In-Reply-To: <20250626101636.1896365-1-jani.nikula@intel.com>
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

--===============2423292190123434597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: drop a number of dependencies on i915_drv.h
URL   : https://patchwork.freedesktop.org/series/150814/
State : failure

== Summary ==

CI Bug Log - changes from xe-3309-d76821a5677456269831568238080f923bc4bf49_FULL -> xe-pw-150814v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150814v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150814v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150814v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-433/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-150814v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +31 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][9], [SKIP][10]) ([Intel XE#316]) +1 other test ( 2 skip )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][13], [SKIP][14]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][17] -> ([PASS][18], [SKIP][19]) ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +160 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][28], [PASS][29]) ([Intel XE#3862]) +1 other test ( 1 incomplete, 1 pass )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][30], [SKIP][31]) ([Intel XE#787]) +62 other tests ( 2 skip )
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][37] -> ([PASS][38], [INCOMPLETE][39]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2907]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4416]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2325])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2252]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#373]) +1 other test ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#373])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-bmg:          NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#2252])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#1178]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2390])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][58], [FAIL][59]) ([Intel XE#1178])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][61] -> ([PASS][62], [SKIP][63]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][64] -> ([SKIP][65], [SKIP][66]) ([Intel XE#2291]) +1 other test ( 2 skip )
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2291]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#4633])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][71] -> ([SKIP][72], [SKIP][73]) ([Intel XE#1340])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#1138])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#310])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html
    - shard-bmg:          NOTRUN -> ([SKIP][77], [PASS][78]) ([Intel XE#2316])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][81] -> ([PASS][82], [SKIP][83]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][84] -> ([SKIP][85], [SKIP][86]) ([Intel XE#2316]) +2 other tests ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [PASS][87] -> ([DMESG-WARN][88], [DMESG-WARN][89]) ([Intel XE#4543]) +1 other test ( 2 dmesg-warn )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][90] -> ([DMESG-WARN][91], [PASS][92]) ([Intel XE#4543]) +1 other test ( 1 dmesg-warn, 1 pass )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][93] -> ([INCOMPLETE][94], [PASS][95]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][96] -> [FAIL][97] ([Intel XE#2882])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#2882])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][99] -> ([PASS][100], [FAIL][101]) ([Intel XE#5337] / [Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
    - shard-bmg:          [PASS][102] -> ([PASS][103], [FAIL][104]) ([Intel XE#2882] / [Intel XE#5338]) +1 other test ( 1 fail, 1 pass )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][105] -> ([PASS][106], [DMESG-FAIL][107]) ([Intel XE#4543])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][108] -> ([FAIL][109], [PASS][110]) ([Intel XE#1874])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#651]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4141]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2311]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#653]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
    - shard-bmg:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#2313]) +1 other test ( 2 skip )
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2313]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
    - shard-bmg:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([Intel XE#2312] / [Intel XE#2313])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#653]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][124], [SKIP][125]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][126] ([Intel XE#5148])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][127] -> ([PASS][128], [SKIP][129]) ([Intel XE#1503])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_hdr@static-swap.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_hdr@static-swap.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][130] -> ([PASS][131], [SKIP][132]) ([Intel XE#3012])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2927])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2927])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2486])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][136] -> [DMESG-WARN][137] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][138] -> ([SKIP][139], [SKIP][140]) ([Intel XE#4596])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#5021])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#5020])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#5020])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][145] -> ([FAIL][146], [FAIL][147]) ([Intel XE#718])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1489])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#1489])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1489])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#2850] / [Intel XE#929]) +3 other tests ( 2 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#3414])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#3414] / [Intel XE#3904])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][160] -> ([PASS][161], [SKIP][162]) ([Intel XE#1435])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][163] -> ([FAIL][164], [FAIL][165]) ([Intel XE#4459]) +1 other test ( 2 fail )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1091] / [Intel XE#2849])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][167], [SKIP][168]) ([Intel XE#455]) +6 other tests ( 2 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#5249])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_configfs@survivability-mode.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][172], [SKIP][173]) ([Intel XE#5308])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_eu_stall@blocking-re-enable.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#5308])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4837])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4837]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][177], [SKIP][178]) ([Intel XE#4837]) +1 other test ( 2 skip )
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_eudebug_online@stopped-thread.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][179] -> ([PASS][180], [SKIP][181]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2322])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [PASS][183] -> [SKIP][184] ([Intel XE#1392]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#288]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][186], [SKIP][187]) ([Intel XE#288]) +5 other tests ( 2 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][188], [SKIP][189]) ([Intel XE#2360])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#4915]) +35 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#4943]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#4915]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html
    - shard-bmg:          NOTRUN -> ([SKIP][193], [SKIP][194]) ([Intel XE#4943]) +1 other test ( 2 skip )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][195], [SKIP][196]) ([Intel XE#4915]) +57 other tests ( 2 skip )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-bmg:          [PASS][197] -> ([FAIL][198], [PASS][199]) ([Intel XE#4937])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2229])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#2541] / [Intel XE#3573])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#2541] / [Intel XE#3573])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#2284] / [Intel XE#366])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][211] -> ([PASS][212], [DMESG-WARN][213]) ([Intel XE#2953] / [Intel XE#4173]) +1 other test ( 1 dmesg-warn, 1 pass )
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][214], [SKIP][215]) ([Intel XE#579])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#4733])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#944])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#4130])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][220] ([Intel XE#827]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][222] ([Intel XE#4543]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][227] +5 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][228] ([Intel XE#2291]) -> ([PASS][229], [PASS][230]) +1 other test ( 2 pass )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4208] / [i915#2575]) -> ([PASS][232], [PASS][233]) +18 other tests ( 2 pass )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][234] ([Intel XE#2291]) -> [PASS][235] +4 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][236] ([Intel XE#1475]) -> ([PASS][237], [PASS][238])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][239] ([Intel XE#4294]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][241] ([Intel XE#2373]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][243] ([Intel XE#2316]) -> [PASS][244] +5 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][245] ([Intel XE#301]) -> ([PASS][246], [PASS][247]) +1 other test ( 2 pass )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][248] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][249], [PASS][250]) +1 other test ( 2 pass )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2351] / [Intel XE#4208]) -> ([PASS][252], [PASS][253]) +3 other tests ( 2 pass )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][254] ([Intel XE#4543]) -> ([PASS][255], [PASS][256]) +1 other test ( 2 pass )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][257] ([Intel XE#1503]) -> ([PASS][258], [PASS][259])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][260] ([Intel XE#1503]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][262] ([Intel XE#3012]) -> ([PASS][263], [PASS][264])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][265] ([Intel XE#616]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][267] ([Intel XE#2571]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1392]) -> ([PASS][270], [PASS][271]) +3 other tests ( 2 pass )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208]) -> ([PASS][273], [PASS][274]) +43 other tests ( 2 pass )
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][276], [SKIP][277]) ([Intel XE#316])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#4208]) -> ([SKIP][279], [SKIP][280]) ([Intel XE#316])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> ([SKIP][282], [SKIP][283]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> ([SKIP][285], [SKIP][286]) ([Intel XE#455] / [Intel XE#787]) +3 other tests ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208] / [i915#2575]) -> ([SKIP][288], [SKIP][289]) ([Intel XE#373]) +1 other test ( 2 skip )
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][290] ([Intel XE#2341]) -> [FAIL][291] ([Intel XE#1178]) +1 other test fail
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_content_protection@legacy.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][292] ([Intel XE#2341]) -> ([FAIL][293], [FAIL][294]) ([Intel XE#1178])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_content_protection@srm.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@srm.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208]) -> ([SKIP][296], [SKIP][297]) ([Intel XE#4354])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][298] ([Intel XE#4354]) -> ([PASS][299], [SKIP][300]) ([Intel XE#4354])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][301] ([Intel XE#2316]) -> ([SKIP][302], [PASS][303]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [DMESG-WARN][304] ([Intel XE#4543]) -> ([PASS][305], [DMESG-WARN][306]) ([Intel XE#4543]) +1 other test ( 1 dmesg-warn, 1 pass )
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [ABORT][307] ([Intel XE#4847]) -> ([ABORT][308], [PASS][309]) ([Intel XE#4847]) +1 other test ( 1 abort, 1 pass )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#4208]) -> ([SKIP][311], [SKIP][312]) ([Intel XE#455]) +1 other test ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][313] ([Intel XE#4543]) -> ([PASS][314], [DMESG-FAIL][315]) ([Intel XE#4543])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][316] ([Intel XE#2312]) -> [SKIP][317] ([Intel XE#2311]) +13 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#2311]) -> ([SKIP][319], [SKIP][320]) ([Intel XE#2311] / [Intel XE#2312]) +13 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][322], [SKIP][323]) ([Intel XE#651])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][324] ([Intel XE#2312]) -> ([SKIP][325], [SKIP][326]) ([Intel XE#2311]) +3 other tests ( 2 skip )
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][327] ([Intel XE#2311]) -> ([SKIP][328], [SKIP][329]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][330] ([Intel XE#4141]) -> ([SKIP][331], [SKIP][332]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][333] ([Intel XE#2312]) -> ([SKIP][334], [SKIP][335]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][336] ([Intel XE#2312]) -> ([SKIP][337], [SKIP][338]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][339] ([Intel XE#2312]) -> [SKIP][340] ([Intel XE#4141]) +5 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][341] ([Intel XE#4141]) -> ([SKIP][342], [SKIP][343]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][344] ([Intel XE#4141]) -> [SKIP][345] ([Intel XE#2312]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> ([SKIP][347], [SKIP][348]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][349] ([Intel XE#2312]) -> ([SKIP][350], [SKIP][351]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][352] ([Intel XE#2311]) -> [SKIP][353] ([Intel XE#2312]) +8 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#4208]) -> ([SKIP][355], [SKIP][356]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][357] ([Intel XE#2313]) -> ([SKIP][358], [SKIP][359]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][360] ([Intel XE#2312]) -> ([SKIP][361], [SKIP][362]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][363] ([Intel XE#2312]) -> [SKIP][364] ([Intel XE#2313]) +14 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][366], [SKIP][367]) ([Intel XE#653]) +1 other test ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#4208]) -> ([SKIP][369], [SKIP][370]) ([Intel XE#1158])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2313]) -> ([SKIP][372], [SKIP][373]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][374] ([Intel XE#2313]) -> [SKIP][375] ([Intel XE#2312]) +6 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][376] ([Intel XE#2312]) -> ([SKIP][377], [SKIP][378]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][379] ([Intel XE#1503]) -> ([SKIP][380], [PASS][381]) ([Intel XE#1503])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][382] ([Intel XE#4596]) -> ([SKIP][383], [SKIP][384]) ([Intel XE#4596] / [Intel XE#5021])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][385] ([Intel XE#5021]) -> ([SKIP][386], [SKIP][387]) ([Intel XE#4596] / [Intel XE#5021])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#4208]) -> ([SKIP][389], [SKIP][390]) ([Intel XE#870])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208]) -> ([SKIP][392], [SKIP][393]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][395], [SKIP][396]) ([Intel XE#2850] / [Intel XE#929])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr@fbc-pr-primary-blt.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr@fbc-pr-primary-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#4208]) -> ([SKIP][398], [SKIP][399]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][400] ([Intel XE#1729]) -> [SKIP][401] ([Intel XE#362])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][402] ([Intel XE#2426]) -> [SKIP][403] ([Intel XE#2509])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#4208]) -> ([SKIP][405], [SKIP][406]) ([Intel XE#1123])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#4208]) -> ([SKIP][408], [SKIP][409]) ([Intel XE#4837]) +3 other tests ( 2 skip )
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#4208]) -> ([PASS][411], [SKIP][412]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1392]) -> ([SKIP][414], [PASS][415]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#4208]) -> ([SKIP][417], [SKIP][418]) ([Intel XE#288]) +5 other tests ( 2 skip )
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> ([SKIP][420], [SKIP][421]) ([Intel XE#2360])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#4208]) -> ([SKIP][423], [SKIP][424]) ([Intel XE#4915]) +61 other tests ( 2 skip )
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][425] ([Intel XE#5018]) -> ([PASS][426], [FAIL][427]) ([Intel XE#4937])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-adlp:         [DMESG-WARN][428] ([Intel XE#4792]) -> ([DMESG-WARN][429], [PASS][430]) ([Intel XE#4792])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208]) -> ([SKIP][432], [SKIP][433]) ([Intel XE#2541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#4208]) -> ([SKIP][435], [SKIP][436]) ([Intel XE#4733])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_pxp@display-pxp-fb.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#4208]) -> ([SKIP][438], [SKIP][439]) ([Intel XE#944])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#4208]) -> ([SKIP][441], [SKIP][442]) ([Intel XE#4130])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5148
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
  [Intel XE#5337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5337
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3309-d76821a5677456269831568238080f923bc4bf49 -> xe-pw-150814v1

  IGT_8428: 8428
  xe-3309-d76821a5677456269831568238080f923bc4bf49: d76821a5677456269831568238080f923bc4bf49
  xe-pw-150814v1: 150814v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/index.html

--===============2423292190123434597==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: drop a number of dependencies on i915_drv.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150814/">https://patchwork.freedesktop.org/series/150814/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3309-d76821a5677456269831568238080f923bc4bf49_FULL -&gt; xe-pw-150814v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150814v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150814v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150814v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-433/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150814v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5337">Intel XE#5337</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5148">Intel XE#5148</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_hdr@static-swap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_hdr@static-swap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308">Intel XE#5308</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308">Intel XE#5308</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_eudebug_online@stopped-thread.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +57 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +18 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a>) +43 other tests ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847">Intel XE#4847</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847">Intel XE#4847</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +61 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_pxp@display-pxp-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3309-d76821a5677456269831568238080f923bc4bf49/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150814v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3309-d76821a5677456269831568238080f923bc4bf49 -&gt; xe-pw-150814v1</li>
</ul>
<p>IGT_8428: 8428<br />
  xe-3309-d76821a5677456269831568238080f923bc4bf49: d76821a5677456269831568238080f923bc4bf49<br />
  xe-pw-150814v1: 150814v1</p>

</body>
</html>

--===============2423292190123434597==--
