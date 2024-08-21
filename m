Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80B5C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 15:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA4D10E185;
	Wed, 21 Aug 2024 15:05:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC710E114;
 Wed, 21 Aug 2024 15:05:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2927634579390680177=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm=3A_Provide_client_setup_hel?=
 =?utf-8?q?per_and_convert_drivers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 15:05:19 -0000
Message-ID: <172425271911.721792.16221741030914422596@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821130348.73038-1-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
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

--===============2927634579390680177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Provide client setup helper and convert drivers (rev2)
URL   : https://patchwork.freedesktop.org/series/137387/
State : failure

== Summary ==

CI Bug Log - changes from xe-1804-c83ab549ef8f647c3de42793d222a980021a973f_full -> xe-pw-137387v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137387v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137387v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137387v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [FAIL][1] +42 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-c-edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_psr@pr-sprite-render.html

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@runner@aborted.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          [SKIP][29] ([Intel XE#1124]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-lnl:          [ABORT][31] ([Intel XE#2583]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          [SKIP][33] ([Intel XE#1424]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x32.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          [SKIP][35] ([Intel XE#1421]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-lnl:          [SKIP][37] ([Intel XE#651]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - {shard-bmg}:        [SKIP][39] ([Intel XE#2293] / [Intel XE#2380]) -> [ABORT][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - {shard-bmg}:        [SKIP][41] ([Intel XE#2293]) -> [ABORT][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-dp-2:
    - {shard-bmg}:        [PASS][43] -> [INCOMPLETE][44] +1 other test incomplete
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-dp-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-dp-2.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][45] ([Intel XE#1473]) -> [INCOMPLETE][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-userptr-rebind:
    - {shard-bmg}:        [PASS][47] -> [ABORT][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-8/igt@xe_exec_basic@many-userptr-rebind.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-3/igt@xe_exec_basic@many-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-137387v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1125])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1033])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#1659])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1407])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [ABORT][55] ([Intel XE#2583]) +7 other tests abort
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#316])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1124])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1124] / [Intel XE#1201])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][61] ([Intel XE#2576]) +7 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#373])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#1705]) +4 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1.html

  * igt@kms_color@ctm-0-50@pipe-c-edp-1:
    - shard-lnl:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2587])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_color@ctm-0-50@pipe-c-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0-50@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#309])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#599])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1874]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#656]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#651]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#734])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][81] ([Intel XE#2029])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1439])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#929])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1406])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          [PASS][85] -> [ABORT][86] ([Intel XE#2583]) +4 other tests abort
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][87] ([Intel XE#2443]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1447])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#688]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1392])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1416])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_mmap@vram.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#379])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@oa-exponents:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#2541])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_oa@oa-exponents.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1061])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][97] -> [ABORT][98] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][99] -> [FAIL][100] ([Intel XE#958])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#958])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#944])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - {shard-bmg}:        [FAIL][104] ([Intel XE#1426]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][106] ([Intel XE#1426]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][108] ([Intel XE#1426]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_color@ctm-0-50@pipe-a-edp-1:
    - shard-lnl:          [ABORT][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_color@ctm-0-50@pipe-a-edp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0-50@pipe-a-edp-1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][112] ([Intel XE#1874]) -> [PASS][113] +3 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][114] ([Intel XE#1503]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][116] ([Intel XE#324]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
    - shard-lnl:          [DMESG-WARN][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html

  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [FAIL][120] ([Intel XE#2058]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-8/igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3.html

  * igt@kms_psr@fbc-psr-cursor-render@edp-1:
    - shard-lnl:          [ABORT][122] ([Intel XE#2583]) -> [PASS][123] +8 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_psr@fbc-psr-cursor-render@edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_psr@fbc-psr-cursor-render@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][124] ([Intel XE#771] / [Intel XE#899]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][126] ([Intel XE#899]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][128] ([Intel XE#1473]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-1/igt@xe_evict@evict-cm-threads-large.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - {shard-bmg}:        [ABORT][130] -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-rebind-prefetch:
    - shard-lnl:          [ABORT][132] ([Intel XE#2583] / [Intel XE#2587]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@xe_exec_fault_mode@many-rebind-prefetch.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-basic:
    - {shard-bmg}:        [ABORT][134] ([Intel XE#2583]) -> [PASS][135] +5 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-1/igt@xe_exec_fault_mode@once-basic.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-7/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-lnl:          [FAIL][136] ([Intel XE#1069]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][138] ([Intel XE#1961] / [Intel XE#2026]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-2/igt@xe_module_load@many-reload.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][140] ([Intel XE#1794]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - {shard-bmg}:        [DMESG-WARN][142] ([Intel XE#877]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-7/igt@xe_vm@large-userptr-misaligned-binds-33554432.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-3/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#324]) -> [FAIL][145] ([Intel XE#1231])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][146] ([Intel XE#1231]) -> [DMESG-FAIL][147] ([Intel XE#324])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][148] ([Intel XE#324]) -> [FAIL][149] ([Intel XE#1231])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-lnl:          [SKIP][150] ([Intel XE#346]) -> [ABORT][151] ([Intel XE#2583])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-6/igt@kms_big_joiner@invalid-modeset.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][152] ([Intel XE#1399]) -> [ABORT][153] ([Intel XE#2583])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_color@ctm-0-50@pipe-b-edp-1:
    - shard-lnl:          [DMESG-WARN][154] -> [ABORT][155] ([Intel XE#2583])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_color@ctm-0-50@pipe-b-edp-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0-50@pipe-b-edp-1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          [SKIP][156] ([Intel XE#656]) -> [ABORT][157] ([Intel XE#2583])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][158] ([Intel XE#1437]) -> [ABORT][159] ([Intel XE#2583])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2576
  [Intel XE#2583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583
  [Intel XE#2587]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2587
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1804-c83ab549ef8f647c3de42793d222a980021a973f -> xe-pw-137387v2

  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: c83ab549ef8f647c3de42793d222a980021a973f
  xe-pw-137387v2: 137387v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/index.html

--===============2927634579390680177==
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
<tr><td><b>Series:</b></td><td>drm: Provide client setup helper and convert=
 drivers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137387/">https://patchwork.freedesktop.org/series/137387/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137387v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137387v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1804-c83ab549ef8f647c3de42793d222a9800=
21a973f_full -&gt; xe-pw-137387v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137387v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137387v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1373=
87v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte@pipe-c-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_psr@pr-sprite-render.html=
">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/sh=
ard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7387v2/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137387v2/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg=
2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2=
/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-466/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137387v2/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-463/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard=
-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-433/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13738=
7v2/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137387v2/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-432/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137387v2/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-dg2-4=
32/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shar=
d-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_bw@c=
onnected-linear-tiling-1-displays-2560x1440p.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/s=
hard-lnl-7/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">F=
AIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_=
cursor_crc@cursor-random-32x32.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip=
@2x-absolute-wf_vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7=
/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-137387v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile-upscaling.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2293">Intel XE#2293</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137387v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-d=
p-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-3/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-dp-2.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387=
v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scal=
ing@pipe-b-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-b=
mg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a><=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-8/igt@xe_exec_=
basic@many-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-3/igt@xe_exec_basic@many-=
userptr-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137387v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/s=
hard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdm=
i-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_big_=
fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-4/igt@kms_big_fb@4-tile=
d-64bpp-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) +7 othe=
r tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi=
-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-xe2-ccs@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2576">Intel XE#2576</a>) +7 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@kms_col=
or@ctm-0-50@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_color@ctm-0-=
50@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +4 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_colo=
r@ctm-0-50@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0-50@pi=
pe-c-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2587">Intel XE#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-3/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-0.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) +4 other=
 tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_evict@evict-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_mmap@vram.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel =
XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_oa@oa-exponents.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137387v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@xe_pm_r=
esidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_pm_residency@toggle=
-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/958">Intel XE#958</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-2/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-7/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1373=
87v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fen=
cing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1426">Intel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137387v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel=
 XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137387v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_colo=
r@ctm-0-50@pipe-a-edp-1.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0-50@p=
ipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1373=
87v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-=
to-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-8/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_plan=
e@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-5/igt@kms_p=
lane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_plan=
e_cursor@overlay@pipe-c-edp-1-size-128.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/ig=
t@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@kms_plan=
e_lowres@tiling-4@pipe-c-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2058">Intel XE#2058</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-8/i=
gt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_psr@=
fbc-psr-cursor-render@edp-1.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-7/igt@km=
s_psr@fbc-psr-cursor-render@edp-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@kms_uni=
versal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adl=
p-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard=
-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-1/igt@xe_evict=
@evict-cm-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-6/igt@xe_e=
vict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-6/igt@xe_exec_=
fault_mode@many-bindexecqueue-rebind-imm.html">ABORT</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-4/igt@xe_=
exec_fault_mode@many-bindexecqueue-rebind-imm.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-8/igt@xe_exec_=
fault_mode@many-rebind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2587">Intel XE#2587</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/=
shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-1/igt@xe_exec_=
fault_mode@once-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-bmg-7/igt@xe_exec_=
fault_mode@once-basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@xe_exec_=
threads@threads-bal-mixed-fd-userptr-invalidate.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2=
/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-2/igt@xe_modu=
le_load@many-reload.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp=
-4/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-adlp-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-bmg-7/igt@xe_vm@la=
rge-userptr-misaligned-binds-33554432.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard=
-bmg-3/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137387v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137387v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-137387v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-6/igt@kms_big_=
joiner@invalid-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-3/igt@kms_big_jo=
iner@invalid-modeset.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-5/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-=
5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-7/igt@kms_colo=
r@ctm-0-50@pipe-b-edp-1.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-lnl-6/igt@kms_color@ctm-0=
-50@pipe-b-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2583">Intel XE#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
387v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb=
-draw-blt.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2583">Intel XE#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/shard-lnl-2/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/shard-ln=
l-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#=
2583</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1804-c83ab549ef8f647c3de42793d222a980021a973f -&gt; xe-pw-137=
387v2</li>
</ul>
<p>IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: c83ab549ef8f647c3de4279=
3d222a980021a973f<br />
  xe-pw-137387v2: 137387v2</p>

</body>
</html>

--===============2927634579390680177==--
