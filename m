Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CACCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308710E90A;
	Thu, 16 Oct 2025 00:50:57 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DC110E90A;
 Thu, 16 Oct 2025 00:50:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0235768507186926440=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/panic=3A_fix_pani?=
 =?utf-8?q?c_structure_allocation_memory_leak_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 00:50:56 -0000
Message-ID: <176057585664.20009.819716800361224139@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015095135.2183415-1-jani.nikula@intel.com>
In-Reply-To: <20251015095135.2183415-1-jani.nikula@intel.com>
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

--===============0235768507186926440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/panic: fix panic structure allocation memory leak (rev2)
URL   : https://patchwork.freedesktop.org/series/155330/
State : failure

== Summary ==

CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_FULL -> xe-pw-155330v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155330v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155330v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155330v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-463/igt@xe_pm_residency@idle-residency.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-466/igt@xe_pm_residency@idle-residency.html

  
New tests
---------

  New tests have been introduced between xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_FULL and xe-pw-155330v2_FULL:

### New IGT tests (3) ###

  * igt@xe_oa@buffer-size@oag-0-128k:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_oa@tail-address-wrap@oag-0-64m:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@xe_oa@tail-address-wrap@oag-0-8m:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  

Known issues
------------

  Here are the changes found in xe-pw-155330v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1125] / [Intel XE#5574]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][5] ([Intel XE#4543]) +12 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124]) +10 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][7] ([Intel XE#2953] / [Intel XE#4173])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#316]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#4543]) +6 other tests dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2191])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#2191]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#787]) +35 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2907]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#4418])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#4416] / [Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#4416]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#373]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#308]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#309]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#1475])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4356])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2244])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#4422])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#703])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1135])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#310]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#4543]) +2 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#301]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293] / [Intel XE#2380])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2293])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#651]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#651]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#5390]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#653]) +13 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#653]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1151])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#656]) +37 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#346])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2925])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455]) +25 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#5020])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#5020])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#2938])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#870])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1129])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#836])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#2387])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#3414] / [Intel XE#3904])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#4459]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [FAIL][93] ([Intel XE#5794])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1126])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#944]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#5626])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#5626]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4837]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4837] / [Intel XE#5565]) +12 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5793])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#261]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1392] / [Intel XE#5575]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#288] / [Intel XE#5561]) +24 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#288]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2360])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4943]) +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#4915]) +243 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html

  * igt@xe_exec_system_allocator@many-new-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4915]) +40 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_exec_system_allocator@many-new-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2229] / [Intel XE#5488])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#5100])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#378])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#3573]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#3573])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_oa@mi-rpc.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2838] / [Intel XE#979])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#5611] / [Intel XE#579])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4650])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][122] -> [FAIL][123] ([Intel XE#5841]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4733] / [Intel XE#5594])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4733])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#944])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#4814] / [Intel XE#5614])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_render_copy@render-stress-2-copies.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][129] ([Intel XE#2291]) -> [PASS][130] +3 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][131] ([Intel XE#1475]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          [SKIP][133] ([Intel XE#2316]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#4543]) -> [PASS][136] +6 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][137] ([Intel XE#1503]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-adlp:         [DMESG-WARN][139] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][140] +11 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#616]) -> [PASS][142] +3 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][143] ([Intel XE#4596]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][145] ([Intel XE#1435]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][147] ([Intel XE#6321]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         [FAIL][149] ([Intel XE#6325]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [SKIP][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][183] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][184] ([Intel XE#1178]) -> [SKIP][185] ([Intel XE#2341])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][186] ([Intel XE#2311]) -> [SKIP][187] ([Intel XE#2312]) +10 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][188] ([Intel XE#2312]) -> [SKIP][189] ([Intel XE#2311]) +10 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#5390]) -> [SKIP][191] ([Intel XE#2312]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#5390]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#2313]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][196] ([Intel XE#2313]) -> [SKIP][197] ([Intel XE#2312]) +11 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][198] ([Intel XE#3544]) -> [SKIP][199] ([Intel XE#3374] / [Intel XE#3544])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][200] ([Intel XE#718]) -> [DMESG-FAIL][201] ([Intel XE#2953] / [Intel XE#4173])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
  [Intel XE#5841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -> xe-pw-155330v2

  IGT_8585: 8585
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d593804d5bb69155d81a
  xe-pw-155330v2: 155330v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/index.html

--===============0235768507186926440==
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
<tr><td><b>Series:</b></td><td>drm/i915/panic: fix panic structure allocati=
on memory leak (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155330/">https://patchwork.freedesktop.org/series/155330/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155330v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155330v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69=
155d81a_FULL -&gt; xe-pw-155330v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155330v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155330v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1553=
30v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_compute_preempt@compute-=
preempt-many-all-ram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-463/igt@xe_pm_=
residency@idle-residency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-466/igt@xe_pm_residency@id=
le-residency.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3924-6a9cafb6723c47062cc4d5938=
04d5bb69155d81a_FULL and xe-pw-155330v2_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_oa@buffer-size@oag-0-128k:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@tail-address-wrap@oag-0-64m:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@tail-address-wrap@oag-0-8m:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155330v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5574">Intel XE#5574</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_async_flips@async-flip-s=
uspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +12 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-fl=
ip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-2/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-6/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_flip@basic-=
plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_joiner@invalid-modeset-=
force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_panel_fitting@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@kms_pip=
e_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shar=
d-adlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-=
1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other tests dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@kms_scaling_modes@scaling-m=
ode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155330v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_compute@ccs-mode-basic.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5794">Intel XE#5794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_eu_stall@blocking-re-ena=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_eu_stall@non-blocking-re-=
enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-uf=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_evict@evict-beng-large-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_evict@evict-cm-threads-la=
rge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_evict@evict-small-cm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575"=
>Intel XE#5575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Inte=
l XE#5561</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_exec_system_allocator@many=
-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_exec_system_allocator@man=
y-large-execqueues-malloc-mlock.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +243 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_exec_system_allocator@ma=
ny-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_=
validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_mmap@pci-membarrier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_oa@mi-rpc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155330v2/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841"=
>Intel XE#5841</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-bmg-1/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-dg2-464/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_render_copy@render-stress=
-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/sha=
rd-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_flip=
@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-2/ig=
t@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adl=
p-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +6 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@kms_pla=
ne@plane-position-covered@pipe-a-plane-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-155330v2/shard-adlp-8/igt@kms_plane@plane-position-covered@pipe-a-plan=
e-1.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-433/igt@kms_pl=
ane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard=
-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-5/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg=
-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_exec=
_reset@cm-gt-reset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6325">Intel XE#6325</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_exec_res=
et@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81=
a/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb691=
55d81a/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5=
bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593=
804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc=
4d593804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47=
062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb67=
23c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9c=
afb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924=
-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/sh=
ard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155330v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155330v2/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330=
v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55330v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155330v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155330v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168"=
>Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-7/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
330v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
30v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
30v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v=
2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155330v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
330v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155330v2/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-9/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155330v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -&gt; xe-pw-155=
330v2</li>
</ul>
<p>IGT_8585: 8585<br />
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d59=
3804d5bb69155d81a<br />
  xe-pw-155330v2: 155330v2</p>

</body>
</html>

--===============0235768507186926440==--
