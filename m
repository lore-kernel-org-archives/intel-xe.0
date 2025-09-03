Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A0CA1009
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 13:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241810E88E;
	Wed,  3 Sep 2025 13:38:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073AD10E88E;
 Wed,  3 Sep 2025 13:38:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0792140394389201881=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/hdmi=3A_Fix_poten?=
 =?utf-8?q?tial_overflow_while_using_intel=5Fencoder=5Fto=5Ftc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 13:38:50 -0000
Message-ID: <175690673001.299175.4686873804622182663@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903035022.3654997-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250903035022.3654997-1-ankit.k.nautiyal@intel.com>
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

--===============0792140394389201881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdmi: Fix potential overflow while using intel_encoder_to_tc
URL   : https://patchwork.freedesktop.org/series/153913/
State : failure

== Summary ==

CI Bug Log - changes from xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375_FULL -> xe-pw-153913v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153913v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153913v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153913v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
Known issues
------------

  Here are the changes found in xe-pw-153913v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#5993]) +3 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#4543]) +12 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#610])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#610])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2191])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1512])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +14 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +83 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4416]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2390])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1188])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#4302])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#4354])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4354])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2244])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2316]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#301]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4543]) +19 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597]) +2 other tests incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#2049] / [Intel XE#2597])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][70] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#1874])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +17 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][79] ([Intel XE#4543])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#5390]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#651]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#656]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2312])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +15 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#5672])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#653]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#656]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-bmg:          [PASS][91] -> [INCOMPLETE][92] ([Intel XE#2594])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#3012])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#4596])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#4658]) +3 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2685] / [Intel XE#3307])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2763]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#870])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3309])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#3309])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#3309])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#718]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#1489])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1128] / [Intel XE#1406])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2330])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#3414] / [Intel XE#3904])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#455]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1499]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1091] / [Intel XE#2849])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4837]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@xe_eudebug@vm-bind-clear-faultable.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4837]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4837]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#4519])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#5793])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#688])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2322]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1392])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1392])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1392] / [Intel XE#5575])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1392]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][142] -> [DMESG-WARN][143] ([Intel XE#3876])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#4943]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-new-race-nomemset:
    - shard-bmg:          [PASS][145] -> [DMESG-FAIL][146] ([Intel XE#5213])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@xe_exec_system_allocator@process-many-new-race-nomemset.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-race-nomemset.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#4915]) +54 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-3/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#4915]) +35 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-large-malloc:
    - shard-bmg:          [PASS][149] -> [FAIL][150] ([Intel XE#4937])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-malloc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4943]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-huge.html

  * igt@xe_exec_threads@threads-userptr-invalidate:
    - shard-adlp:         [PASS][152] -> [DMESG-FAIL][153] ([Intel XE#3876])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-1/igt@xe_exec_threads@threads-userptr-invalidate.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@xe_exec_threads@threads-userptr-invalidate.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2459] / [Intel XE#2596])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#5100])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#3573]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#3573]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#5694])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#5694])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#5694])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#5694])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][162] -> [INCOMPLETE][163] ([Intel XE#4504])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@xe_pm@s2idle-mocs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#584])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#579])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][166] -> [ABORT][167] ([Intel XE#3970])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4733]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4733])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4130])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#4130]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#4543]) -> [PASS][174] +4 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][177] ([Intel XE#5338]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][179] ([Intel XE#2316]) -> [PASS][180] +5 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#4543]) -> [PASS][182] +6 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#5208]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][187] ([Intel XE#616]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][189] ([Intel XE#718]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-adlp:         [DMESG-FAIL][191] ([Intel XE#3876]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1392]) -> [PASS][194] +4 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-adlp:         [ABORT][195] ([Intel XE#5790]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
    - shard-bmg:          [ABORT][197] ([Intel XE#5790]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
    - shard-bmg:          [FAIL][199] -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#3876]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-bmg:          [DMESG-FAIL][203] ([Intel XE#3876]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][205] ([Intel XE#3876]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#5545]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_pm@s3-basic.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_pm@s3-basic.html
    - shard-bmg:          [DMESG-FAIL][209] ([Intel XE#5545]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_pm@s3-basic.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@xe_pm@s3-basic.html

  * igt@xe_query@query-cs-cycles:
    - shard-dg2-set2:     [FAIL][211] -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-432/igt@xe_query@query-cs-cycles.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_query@query-cs-cycles.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][213] ([Intel XE#1178]) -> [SKIP][214] ([Intel XE#2341])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_content_protection@srm.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][215] ([Intel XE#1188]) -> [SKIP][216] ([Intel XE#2341])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-2/igt@kms_content_protection@uevent.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#2311]) +9 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][219] ([Intel XE#2311]) -> [SKIP][220] ([Intel XE#2312]) +10 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#5390]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][223] ([Intel XE#5390]) -> [SKIP][224] ([Intel XE#2312]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#2313]) +9 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][227] ([Intel XE#2313]) -> [SKIP][228] ([Intel XE#2312]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][229] ([Intel XE#1729]) -> [SKIP][230] ([Intel XE#2426])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][231] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][232] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][233] ([Intel XE#1173]) -> [SKIP][234] ([Intel XE#1061])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-433/igt@xe_peer2peer@read.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         [SKIP][235] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][236] ([Intel XE#5545])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5790]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8519 -> IGT_8520
  * Linux: xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375 -> xe-pw-153913v1

  IGT_8519: 8519
  IGT_8520: 8520
  xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375: 97a9560f0f1dd0a4472e669ff2188d0a8293b375
  xe-pw-153913v1: 153913v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/index.html

--===============0792140394389201881==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdmi: Fix potential overflow while using intel_encoder_to_tc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153913/">https://patchwork.freedesktop.org/series/153913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375_FULL -&gt; xe-pw-153913v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153913v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153913v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153913v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153913v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_invalid_mode@int-max-clock.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-8/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@xe_exec_system_allocator@process-many-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-race-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-3/igt@xe_exec_system_allocator@processes-evict-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-malloc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-1/igt@xe_exec_threads@threads-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@xe_exec_threads@threads-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-4/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-1/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-433/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790">Intel XE#5790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790">Intel XE#5790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-9/igt@xe_pm@s3-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-8/igt@xe_pm@s3-basic.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@xe_pm@s3-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-7/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-432/igt@xe_query@query-cs-cycles.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_query@query-cs-cycles.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153913v1/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8519 -&gt; IGT_8520</li>
<li>Linux: xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375 -&gt; xe-pw-153913v1</li>
</ul>
<p>IGT_8519: 8519<br />
  IGT_8520: 8520<br />
  xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375: 97a9560f0f1dd0a4472e669ff2188d0a8293b375<br />
  xe-pw-153913v1: 153913v1</p>

</body>
</html>

--===============0792140394389201881==--
