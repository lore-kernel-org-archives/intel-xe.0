Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E3C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 19:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96910E079;
	Fri, 14 Feb 2025 19:39:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4895610E079;
 Fri, 14 Feb 2025 19:39:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7409145974513419961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Stop_reading?=
 =?utf-8?q?_masks_from_device_memory_when_populating_the_ADS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 19:39:47 -0000
Message-ID: <173956198728.2143983.8908971099132631873@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
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

--===============7409145974513419961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Stop reading masks from device memory when populating the ADS
URL   : https://patchwork.freedesktop.org/series/144827/
State : failure

== Summary ==

CI Bug Log - changes from xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7_full -> xe-pw-144827v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144827v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144827v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144827v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@bo-too-big@a-edp1:
    - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-8/igt@kms_flip@bo-too-big@a-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-5/igt@kms_flip@bo-too-big@a-edp1.html

  
#### Warnings ####

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][8] ([Intel XE#4172]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-144827v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-bmg:          [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4172]) +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#3767]) +15 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3225])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#619])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1033])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +148 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#3862]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1033]) +8 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][34] ([Intel XE#1033])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][36] ([Intel XE#4148]) +1 other test incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#309]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2291]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#3009])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_dp_aux_dev.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#310]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#3321]) +4 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#886]) +4 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +4 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#2953]) +2 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293] / [Intel XE#2380])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2293])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#656]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4141]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2352])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#1503])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#4173]) +1 other test dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#616])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_plane_cursor@overlay.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#616])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2763]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#836])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1489])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1489]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][81] ([Intel XE#1033]) +14 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][82] ([Intel XE#4172]) +15 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#756])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2905]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2905])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][86] ([Intel XE#1033] / [Intel XE#1473])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#1392]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#288]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2360])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][91] -> [DMESG-WARN][92] ([Intel XE#3876])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#512])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [ABORT][95] ([Intel XE#1033] / [Intel XE#4268])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][97] ([Intel XE#1033]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][99] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][101] ([Intel XE#2291]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][103] ([Intel XE#1475]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][105] ([Intel XE#2882]) -> [PASS][106] +2 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#310]) -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][109] ([Intel XE#2316]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][111] ([Intel XE#3321]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#301]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-panning@a-dp2:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#4172]) -> [PASS][116] +16 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@flip-vs-panning@a-dp2.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@flip-vs-panning@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][117] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#656]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#309]) -> [PASS][122] +3 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [DMESG-WARN][123] -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#899]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +3 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_threads@threads-rebind:
    - shard-dg2-set2:     [DMESG-WARN][129] ([Intel XE#1033]) -> [PASS][130] +6 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@xe_exec_threads@threads-rebind.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_threads@threads-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][131] ([Intel XE#1033]) -> [DMESG-FAIL][132] ([Intel XE#1033] / [Intel XE#2953])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][134] ([Intel XE#787]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#787]) -> [SKIP][136] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [INCOMPLETE][137] -> [DMESG-FAIL][138] ([Intel XE#1033])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_content_protection@srm.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#4172]) -> [SKIP][140] ([Intel XE#2291])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#1033]) -> [SKIP][142] ([Intel XE#309])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [DMESG-WARN][143] ([Intel XE#1033]) -> [DMESG-WARN][144] ([Intel XE#2955]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][145] ([Intel XE#2316]) -> [DMESG-WARN][146] ([Intel XE#4172]) +3 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
    - shard-dg2-set2:     [DMESG-WARN][147] ([Intel XE#1033]) -> [SKIP][148] ([Intel XE#310])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][149] ([Intel XE#2312]) -> [SKIP][150] ([Intel XE#2311]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#656]) -> [SKIP][152] ([Intel XE#651]) +10 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][153] ([Intel XE#2312]) -> [SKIP][154] ([Intel XE#4141]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][155] ([Intel XE#4141]) -> [SKIP][156] ([Intel XE#2312]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#651]) -> [SKIP][158] ([Intel XE#656]) +13 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][159] ([Intel XE#2311]) -> [SKIP][160] ([Intel XE#2312]) +11 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][161] ([Intel XE#2312]) -> [SKIP][162] ([Intel XE#2313]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#2313]) -> [SKIP][164] ([Intel XE#2312]) +12 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#653]) -> [SKIP][166] ([Intel XE#656]) +12 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#656]) -> [SKIP][168] ([Intel XE#653]) +7 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg2-set2:     [INCOMPLETE][169] -> [DMESG-WARN][170] ([Intel XE#1033])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-433/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1500]) -> [SKIP][172] ([Intel XE#362])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [ABORT][173] ([Intel XE#4172] / [Intel XE#4268]) -> [ABORT][174] ([Intel XE#4268])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@xe_pm@s4-exec-after.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_pm@s4-exec-after.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7 -> xe-pw-144827v1

  IGT_8229: 8229
  xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7: 4570ecc1f49b000dbba61bb05e22ef5db89382b7
  xe-pw-144827v1: 144827v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/index.html

--===============7409145974513419961==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Stop reading masks from device memory when populating the ADS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144827/">https://patchwork.freedesktop.org/series/144827/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7_full -&gt; xe-pw-144827v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144827v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144827v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144827v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-8/igt@kms_flip@bo-too-big@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-5/igt@kms_flip@bo-too-big@a-edp1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144827v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148">Intel XE#4148</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@flip-vs-panning@a-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@flip-vs-panning@a-dp2.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@xe_exec_threads@threads-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@xe_exec_threads@threads-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_content_protection@srm.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_content_protection@srm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-433/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7/shard-bmg-5/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144827v1/shard-bmg-7/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7 -&gt; xe-pw-144827v1</li>
</ul>
<p>IGT_8229: 8229<br />
  xe-2660-4570ecc1f49b000dbba61bb05e22ef5db89382b7: 4570ecc1f49b000dbba61bb05e22ef5db89382b7<br />
  xe-pw-144827v1: 144827v1</p>

</body>
</html>

--===============7409145974513419961==--
