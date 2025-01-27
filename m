Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14792C0218A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 20:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47E010E5BC;
	Mon, 27 Jan 2025 20:34:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2006510E5BB;
 Mon, 27 Jan 2025 20:34:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6496214144854322665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Enable_Survivability_mode_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jan 2025 20:34:54 -0000
Message-ID: <173801009410.1567269.1268206196330749005@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127080716.643697-1-riana.tauro@intel.com>
In-Reply-To: <20250127080716.643697-1-riana.tauro@intel.com>
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

--===============6496214144854322665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Survivability mode (rev6)
URL   : https://patchwork.freedesktop.org/series/142464/
State : failure

== Summary ==

CI Bug Log - changes from xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132_full -> xe-pw-142464v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142464v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142464v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142464v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +8 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20.html

  
#### Warnings ####

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][5] ([Intel XE#2136]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  
Known issues
------------

  Here are the changes found in xe-pw-142464v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3440])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@core_getversion@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3249])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#3157])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3157])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1033]) +6 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#911]) +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#873])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3279])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124]) +10 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2136]) +30 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][26] -> [DMESG-FAIL][27] ([Intel XE#1033]) +7 other tests dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#316]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1512]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#2191]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#367]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +55 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2907]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#3442])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3433]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#3442])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +35 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#2692] / [Intel XE#4010]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#314]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#314]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#314]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#306])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#306])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#373]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#373]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2252])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#373]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][59] ([Intel XE#1033]) +1 other test dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#307]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#1178])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#3278]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#308])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2321])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1424]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#4172]) +19 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#309]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#309]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#3007])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2423] / [i915#2575])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#323])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#701])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#701])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#702])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#702])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1138])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1138])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1138])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [INCOMPLETE][85] ([Intel XE#2049]) +1 other test incomplete
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#310]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][87] -> [FAIL][88] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#301]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][91] -> [FAIL][92] ([Intel XE#3321]) +4 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][93] ([Intel XE#4172]) +8 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1421]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2955])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][97] -> [INCOMPLETE][98] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2423]) +119 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][101] ([Intel XE#2049]) +1 other test incomplete
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][102] -> [FAIL][103] ([Intel XE#886]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][104] ([Intel XE#2882]) +2 other tests fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][105] ([Intel XE#3321]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [PASS][106] -> [INCOMPLETE][107] ([Intel XE#2049] / [Intel XE#2597])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#886])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1397] / [Intel XE#1745])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1397])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][114] -> [DMESG-FAIL][115] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1401] / [Intel XE#1745])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1401])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2293]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#651]) +12 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#651]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#656]) +32 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#651]) +17 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][123] ([Intel XE#1033]) +3 other tests dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][124] -> [DMESG-WARN][125] ([Intel XE#1033]) +57 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4141])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#656]) +24 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#653]) +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#653]) +12 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2136])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1450] / [Intel XE#2568])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1450]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#356])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#356])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#455]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#616]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2763]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2763]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2763]) +27 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-bmg:          [PASS][143] -> [DMESG-WARN][144] ([Intel XE#2566] / [Intel XE#4172]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2763]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2423])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#3309])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#3309])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1129])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][150] -> [SKIP][151] ([Intel XE#2446]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#836]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][153] -> [DMESG-WARN][154] ([Intel XE#1033] / [Intel XE#2042])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1489]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1489]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1122])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1406]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#3414]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][162] ([Intel XE#1874])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1127])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1127])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#362])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#362])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#455] / [Intel XE#488])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#1447]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1447])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@exec-queue-create-invalid-reserved:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#1130]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_create@exec-queue-create-invalid-reserved.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#2905]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#2905]) +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2905]) +6 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#688]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#1392]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#1392]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#288]) +22 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#288]) +13 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1192])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@xe_live_ktest@xe_bo.html
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2229])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#2229])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][185] ([Intel XE#1999]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#977])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#979])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#979])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][191] ([Intel XE#1173]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#2284] / [Intel XE#366])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [PASS][195] -> [DMESG-WARN][196] ([Intel XE#1616] / [Intel XE#4172])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][197] ([Intel XE#4172] / [Intel XE#569])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][198] ([Intel XE#1033] / [Intel XE#569])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#584]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][200] -> [ABORT][201] ([Intel XE#1358] / [Intel XE#1607])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][202] -> [ABORT][203] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][204] -> [ABORT][205] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#944])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#944])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#944])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][209] -> [SKIP][210] ([Intel XE#1130]) +254 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][211] ([Intel XE#3249]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][213] ([Intel XE#1033]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [INCOMPLETE][215] -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_atomic@plane-invalid-params.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][217] ([Intel XE#2136]) -> [PASS][218] +27 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][219] ([Intel XE#829]) -> [PASS][220] +2 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][221] ([Intel XE#1033]) -> [PASS][222] +3 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][223] ([Intel XE#1874]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][227] -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][229] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][231] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][233] ([Intel XE#4172]) -> [PASS][234] +44 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [INCOMPLETE][235] ([Intel XE#3226]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#877]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][239] ([Intel XE#3321]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [DMESG-WARN][241] ([Intel XE#1033]) -> [PASS][242] +72 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][243] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][245] ([Intel XE#301]) -> [PASS][246] +2 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][247] ([Intel XE#2953]) -> [PASS][248] +3 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][249] ([Intel XE#2882]) -> [PASS][250] +2 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-dp2:
    - shard-bmg:          [FAIL][251] -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_flip@plain-flip-ts-check@a-dp2.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@plain-flip-ts-check@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][253] ([Intel XE#886]) -> [PASS][254] +4 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][255] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-bmg:          [SKIP][257] ([Intel XE#540]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_force_connector_basic@force-connector-state.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [SKIP][261] ([Intel XE#4108]) -> [PASS][262] +5 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][263] ([Intel XE#718]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][265] ([Intel XE#1430]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][267] ([Intel XE#2446]) -> [PASS][268] +4 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_rpm@cursor.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_properties@connector-properties-atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][269] -> [PASS][270] +1 other test pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_properties@connector-properties-atomic@pipe-a-dp-4.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_properties@connector-properties-atomic@pipe-a-dp-4.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [INCOMPLETE][271] -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][273] ([Intel XE#2423]) -> [PASS][274] +84 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_sequence@get-idle.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_sequence@get-idle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][275] ([Intel XE#2159]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][277] -> [PASS][278] +4 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][279] ([Intel XE#1192]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][281] ([Intel XE#1999]) -> [PASS][282] +2 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][283] ([Intel XE#3546]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_module_load@many-reload.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][285] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][286] +2 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][287] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][289] ([Intel XE#1033] / [Intel XE#2280]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-lnl:          [ABORT][291] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-adlp:         [ABORT][293] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@bind-no-array-conflict:
    - shard-bmg:          [SKIP][295] ([Intel XE#1130]) -> [PASS][296] +204 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_vm@bind-no-array-conflict.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_vm@bind-no-array-conflict.html

  * igt@xe_vm@large-misaligned-binds-536870912:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1130]) -> [PASS][298] +6 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_vm@large-misaligned-binds-536870912.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_vm@large-misaligned-binds-536870912.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][299] ([Intel XE#2423]) -> [SKIP][300] ([Intel XE#2233])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][301] ([Intel XE#4108]) -> [SKIP][302] ([Intel XE#873])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][303] ([Intel XE#2423]) -> [SKIP][304] ([Intel XE#3768])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][305] ([Intel XE#2370]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][307] ([Intel XE#2423]) -> [SKIP][308] ([Intel XE#2370])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][309] ([Intel XE#2327]) -> [SKIP][310] ([Intel XE#2136]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#2327]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][313] ([Intel XE#4172]) -> [SKIP][314] ([Intel XE#2136]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][315] ([Intel XE#1124]) -> [SKIP][316] ([Intel XE#2136]) +15 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][317] ([Intel XE#2328]) -> [SKIP][318] ([Intel XE#2136])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][319] ([Intel XE#1033]) -> [FAIL][320] ([Intel XE#1231])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#1124])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][323] ([Intel XE#607]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][325] ([Intel XE#2136]) -> [SKIP][326] ([Intel XE#610])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][327] ([Intel XE#829]) -> [SKIP][328] ([Intel XE#2136])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#1124]) +11 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#2314] / [Intel XE#2894])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][333] ([Intel XE#4108]) -> [SKIP][334] ([Intel XE#2423])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][335] ([Intel XE#367]) -> [SKIP][336] ([Intel XE#2423]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][337] ([Intel XE#2423]) -> [SKIP][338] ([Intel XE#367]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][339] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][340] ([Intel XE#2136]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#2887]) +19 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][343] -> [INCOMPLETE][344] ([Intel XE#3862])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][345] ([Intel XE#4172]) -> [INCOMPLETE][346] ([Intel XE#3862])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#2652] / [Intel XE#787])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][349] ([Intel XE#3432]) -> [SKIP][350] ([Intel XE#2136]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#3432])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][353] ([Intel XE#2887]) -> [SKIP][354] ([Intel XE#2136]) +22 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][357] -> [SKIP][358] ([Intel XE#2136]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][359] ([Intel XE#2252]) -> [SKIP][360] ([Intel XE#2423]) +14 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][361] ([Intel XE#2325]) -> [SKIP][362] ([Intel XE#2423]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][363] ([Intel XE#2423]) -> [SKIP][364] ([Intel XE#2325]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][365] ([Intel XE#4108]) -> [SKIP][366] ([Intel XE#2252]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2423] / [i915#2575]) -> [SKIP][368] ([Intel XE#373]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][369] ([Intel XE#2423]) -> [SKIP][370] ([Intel XE#2252]) +14 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][371] ([Intel XE#4172]) -> [FAIL][372] ([Intel XE#1178]) +1 other test fail
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][373] ([Intel XE#2423]) -> [SKIP][374] ([Intel XE#2390])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][375] ([Intel XE#2390]) -> [SKIP][376] ([Intel XE#3007])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#307]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][379] ([Intel XE#4108]) -> [SKIP][380] ([Intel XE#2390])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][381] ([Intel XE#2423]) -> [FAIL][382] ([Intel XE#1178])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_content_protection@legacy.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][383] ([Intel XE#2423]) -> [SKIP][384] ([Intel XE#2320]) +5 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][385] ([Intel XE#2320]) -> [SKIP][386] ([Intel XE#2423]) +3 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][387] ([Intel XE#2321]) -> [SKIP][388] ([Intel XE#2423]) +4 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][389] ([Intel XE#2423]) -> [SKIP][390] ([Intel XE#2321]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][391] ([Intel XE#2423]) -> [SKIP][392] ([Intel XE#2286])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][393] ([Intel XE#2423]) -> [DMESG-WARN][394] ([Intel XE#877])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [SKIP][395] ([Intel XE#2423]) -> [DMESG-WARN][396] ([Intel XE#4172]) +6 other tests dmesg-warn
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cursor_legacy@forked-move.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][397] ([Intel XE#2286]) -> [SKIP][398] ([Intel XE#2423])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move:
    - shard-bmg:          [DMESG-WARN][399] ([Intel XE#4172]) -> [SKIP][400] ([Intel XE#2423]) +5 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_cursor_legacy@single-move.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_cursor_legacy@single-move.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#1508]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][403] ([Intel XE#2323]) -> [SKIP][404] ([Intel XE#2423])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][405] ([Intel XE#2244]) -> [SKIP][406] ([Intel XE#2136]) +4 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#2244]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#4156])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][411] ([Intel XE#776]) -> [SKIP][412] ([Intel XE#2136])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][413] ([Intel XE#2372]) -> [SKIP][414] ([Intel XE#2423])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][415] ([Intel XE#2423]) -> [SKIP][416] ([Intel XE#2375])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][417] ([Intel XE#2423]) -> [FAIL][418] ([Intel XE#3321])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][419] ([Intel XE#1033]) -> [FAIL][420] ([Intel XE#301])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][421] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][422] ([Intel XE#2136]) +8 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][423] ([Intel XE#2136]) -> [SKIP][424] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][425] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][426] ([Intel XE#324]) +1 other test dmesg-fail
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][427] ([Intel XE#4108]) -> [SKIP][428] ([Intel XE#2311]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][429] ([Intel XE#2311]) -> [SKIP][430] ([Intel XE#2136]) +49 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][431] ([Intel XE#4141]) -> [SKIP][432] ([Intel XE#2136]) +16 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][433] ([Intel XE#2136]) -> [SKIP][434] ([Intel XE#4141]) +14 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][435] ([Intel XE#4108]) -> [SKIP][436] ([Intel XE#4141])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136]) -> [SKIP][438] ([Intel XE#651])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][439] ([Intel XE#4108]) -> [SKIP][440] ([Intel XE#2136]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#2311]) +42 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][444] ([Intel XE#651])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#2313]) +38 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][447] ([Intel XE#2313]) -> [SKIP][448] ([Intel XE#2136]) +43 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][449] ([Intel XE#4108]) -> [SKIP][450] ([Intel XE#2313])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][452] ([Intel XE#653])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][453] ([Intel XE#2423]) -> [SKIP][454] ([Intel XE#2502])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][455] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][456] ([Intel XE#2423])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][457] ([Intel XE#2934]) -> [SKIP][458] ([Intel XE#2136])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][459] ([Intel XE#2136]) -> [SKIP][460] ([Intel XE#2927]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#346])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][463] ([Intel XE#2423]) -> [SKIP][464] ([Intel XE#2501])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@viewport:
    - shard-bmg:          [FAIL][465] -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_plane_cursor@viewport.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][467] ([Intel XE#2393]) -> [SKIP][468] ([Intel XE#2423])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][469] ([Intel XE#2423]) -> [SKIP][470] ([Intel XE#2493])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][471] ([Intel XE#2763]) -> [SKIP][472] ([Intel XE#2423]) +2 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][473] ([Intel XE#2423]) -> [SKIP][474] ([Intel XE#2763])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][475] ([Intel XE#870]) -> [SKIP][476] ([Intel XE#2136])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_pm_backlight@fade.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#2391])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][479] ([Intel XE#2136]) -> [SKIP][480] ([Intel XE#2392])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][481] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][482] ([Intel XE#2446])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][483] ([Intel XE#2446]) -> [SKIP][484] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [SKIP][485] ([Intel XE#2446]) -> [DMESG-WARN][486] ([Intel XE#4172])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-bmg:          [SKIP][487] ([Intel XE#780]) -> [SKIP][488] ([Intel XE#2423])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_prop_blob@blob-prop-lifetime.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][489] ([Intel XE#1489]) -> [SKIP][490] ([Intel XE#2136]) +10 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#1489]) +7 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][493] ([Intel XE#4108]) -> [SKIP][494] ([Intel XE#1489])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][495] ([Intel XE#2136]) -> [SKIP][496] ([Intel XE#2387])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2136]) -> [SKIP][498] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][499] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][500] ([Intel XE#2136]) +19 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr@psr-basic.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][501] ([Intel XE#2136]) -> [SKIP][502] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][503] ([Intel XE#2234]) -> [SKIP][504] ([Intel XE#2136])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][505] ([Intel XE#2414]) -> [SKIP][506] ([Intel XE#2136])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][507] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][508] ([Intel XE#2423]) +2 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][509] ([Intel XE#2330]) -> [SKIP][510] ([Intel XE#2423])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][511] ([Intel XE#2423]) -> [SKIP][512] ([Intel XE#2330])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][513] ([Intel XE#2423]) -> [SKIP][514] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][515] ([Intel XE#2413]) -> [SKIP][516] ([Intel XE#2423]) +1 other test skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [DMESG-WARN][517] ([Intel XE#1033]) -> [FAIL][518] ([Intel XE#1174])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_sysfs_edid_timing.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][519] ([Intel XE#2168]) -> [SKIP][520] ([Intel XE#2423])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_vrr@cmrr.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][521] ([Intel XE#1499]) -> [SKIP][522] ([Intel XE#2423])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_vrr@flip-basic.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][523] ([Intel XE#2423]) -> [SKIP][524] ([Intel XE#1499]) +4 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_vrr@flip-suspend.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][525] ([Intel XE#4108]) -> [SKIP][526] ([Intel XE#1499])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][527] ([Intel XE#2423]) -> [SKIP][528] ([Intel XE#756])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_writeback@writeback-check-output.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_writeback@writeback-check-output.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#1123])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][531] ([Intel XE#1130]) -> [SKIP][532] ([Intel XE#2905]) +12 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][533] ([Intel XE#2905]) -> [SKIP][534] ([Intel XE#1130]) +15 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-bmg:          [SKIP][535] ([Intel XE#3889]) -> [SKIP][536] ([Intel XE#1130])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130]) -> [SKIP][538] ([Intel XE#2905])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_eudebug_online@single-step-one.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][539] ([Intel XE#2322]) -> [SKIP][540] ([Intel XE#1130]) +12 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][541] ([Intel XE#1130]) -> [SKIP][542] ([Intel XE#2322]) +10 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1130]) -> [SKIP][544] ([Intel XE#288]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - shard-bmg:          [SKIP][545] ([Intel XE#1130]) -> [DMESG-WARN][546] ([Intel XE#4172]) +1 other test dmesg-warn
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_exec_threads@threads-userptr-rebind-err.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@xe_exec_threads@threads-userptr-rebind-err.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][547] ([Intel XE#1192]) -> [SKIP][548] ([Intel XE#2833])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1192]) -> [FAIL][550] ([Intel XE#1999])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][551] ([Intel XE#1130]) -> [SKIP][552] ([Intel XE#586])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_mmap@small-bar.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][553], [PASS][554], [PASS][555], [PASS][556], [PASS][557], [PASS][558], [PASS][559], [PASS][560], [PASS][561], [PASS][562], [PASS][563], [SKIP][564], [DMESG-WARN][565], [PASS][566], [PASS][567], [PASS][568], [PASS][569], [PASS][570], [PASS][571], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PASS][578]) ([Intel XE#378]) -> ([PASS][579], [PASS][580], [PASS][581], [PASS][582], [PASS][583], [PASS][584], [SKIP][585], [PASS][586], [PASS][587], [PASS][588], [PASS][589], [PASS][590], [PASS][591], [PASS][592], [PASS][593], [PASS][594], [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PASS][600], [PASS][601], [PASS][602], [PASS][603], [PASS][604]) ([Intel XE#378])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_module_load@load.html

  * igt@xe_oa@enable-disable:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1130]) -> [SKIP][606] ([Intel XE#2541] / [Intel XE#3573])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_oa@enable-disable.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_oa@enable-disable.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][607] ([Intel XE#1420]) -> [SKIP][608] ([Intel XE#1130])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][609] ([Intel XE#2245]) -> [SKIP][610] ([Intel XE#1130])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_pat@pat-index-xelp.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#2236])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][613] ([Intel XE#2284]) -> [SKIP][614] ([Intel XE#1130]) +3 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][615] ([Intel XE#4172] / [Intel XE#569]) -> [SKIP][616] ([Intel XE#1130])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][617] ([Intel XE#944]) -> [SKIP][618] ([Intel XE#1130]) +3 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][619] ([Intel XE#1130]) -> [SKIP][620] ([Intel XE#944]) +3 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][621] ([Intel XE#4130]) -> [SKIP][622] ([Intel XE#1130])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][623] ([Intel XE#1130]) -> [SKIP][624] ([Intel XE#4130]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][625] ([Intel XE#3342]) -> [SKIP][626] ([Intel XE#1130])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4108]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8209 -> IGT_8210
  * Linux: xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132 -> xe-pw-142464v6

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132: 9606e7472e23df21b5a4ad0c4845643eed592132
  xe-pw-142464v6: 142464v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/index.html

--===============6496214144854322665==
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
<tr><td><b>Series:</b></td><td>Enable Survivability mode (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142464/">https://patchwork.freedesktop.org/series/142464/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142464v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142464v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2555-9606e7472e23df21b5a4ad0c4845643ee=
d592132_full -&gt; xe-pw-142464v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142464v6_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142464v6_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1424=
64v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain=
-flip-fb-recreate@a-edp1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@kms_pla=
ne_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_plane_sc=
aling@planes-upscale-20x20.html">DMESG-WARN</a> +8 other tests dmesg-warn</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_dirty=
fb@fbc-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142464v6_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440"=
>Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@core_set=
master@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@core_setmaster@ma=
ster-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@km=
s_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/i=
gt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel =
XE#3719</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/=
shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp=
-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@linear-8=
bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-a=
dlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_bw@linear-tiling-1-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_bw@linear-tiling-4-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2692">Intel XE#2692</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) +1 other t=
est incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-6/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@kms_chamelium_color@gamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-=
storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_color@ctm-0-75.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_cursor_crc@cursor-rando=
m-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_cursor_crc@cursor-random-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_curs=
or_edge_walk@256x256-left-edge@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@km=
s_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4=
172</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_cu=
rsor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sh=
ard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/s=
hard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-=
hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking=
-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +8 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_fli=
p@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/=
igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049=
">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a>) +119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-ch=
eck-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 othe=
r test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-3/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_flip@flip-v=
s-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-=
vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_flip@flip-vs-expired-vbla=
nk@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_=
flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain=
-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip@plain=
-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142464v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +32 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other=
 tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) +57 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_panel_fitting@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@=
kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +27 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg=
-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_pm_r=
pm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@kms_psr@pr-primary-page-flip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_rotation_crc@multiplane-=
rotation-cropping-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_ccs@block-copy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@exec-queue-create-invalid-reserved:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_create@exec-queue-create-i=
nvalid-reserved.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_eudebug@basic-exec-queues=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_eudebug_online@breakpoin=
t-many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_evict@evict-small-external=
-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-4/igt@xe_live_ktest@xe_bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_oa@invalid-remove-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_oa@privileged-forked-acc=
ess-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_pm@s2=
idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-pr=
efetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-8/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@x=
e_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +254 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@core_set=
master@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@cor=
e_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v6/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-d=
p-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_atom=
ic@plane-invalid-params.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_atomic@plan=
e-invalid-params.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v6/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg=
-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142464v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/=
shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142464v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_=
ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4010">Intel XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_colo=
r@ctm-0-75@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/ig=
t@kms_color@ctm-0-75@pipe-d-hdmi-a-3.html">PASS</a> +44 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-legacy.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard=
-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142464v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-4=
36/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +72 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466=
/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +3 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check@a-dp2.html">FAIL</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_flip@plain-fli=
p-ts-check@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-ln=
l-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> +4 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_flip_sca=
led_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_forc=
e_connector_basic@force-connector-state.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg=
-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142464v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sh=
ard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PA=
SS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-8/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/igt@kms_pm_dc@dc6-psr.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_r=
pm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_pm_rpm@cursor.htm=
l">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@kms_pr=
operties@connector-properties-atomic@pipe-a-dp-4.html">FAIL</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-43=
4/igt@kms_properties@connector-properties-atomic@pipe-a-dp-4.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-4/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">INCOMPLETE</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-=
4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_sequ=
ence@get-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_sequence@get-=
idle.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-3/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-7/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/s=
hard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_ini=
t.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@xe_bo=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-b=
mg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_modul=
e_load@many-reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@xe_module_lo=
ad@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_pm@s3=
-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7=
/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-=
466/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@xe_pm@=
s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg=
2-436/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-lnl-3/ig=
t@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/i=
gt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_vm@bi=
nd-no-array-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_vm@bind=
-no-array-conflict.html">PASS</a> +204 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_vm@=
large-misaligned-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/=
igt@xe_vm@large-misaligned-binds-536870912.html">PASS</a> +6 other tests pa=
ss</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-=
4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_=
async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_asyn=
c_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/i=
gt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370=
">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142464v6/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_big_=
fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/ig=
t@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0=
-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-=
3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/ig=
t@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sh=
ard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/=
shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sh=
ard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/=
igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_bw@l=
inear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-=
1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms=
_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel X=
E#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v6/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Int=
el XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard=
-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/s=
hard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-d=
g2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">In=
tel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_ch=
amelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v6/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution=
-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +14=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sh=
ard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_curs=
or_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@k=
ms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@km=
s_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v6/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_curs=
or_legacy@forked-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_curso=
r_legacy@forked-move.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_curs=
or_legacy@single-move.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms=
_cursor_legacy@single-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_disp=
lay_modes@mst-extended-mode-negative.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-=
3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_fbcon_fbt@p=
sr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_flip=
@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_fli=
p@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/s=
hard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142464v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp=
-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other=
 test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscr=
n-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#41=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142464v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4108">Intel XE#4=
108</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndsc=
rn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_getf=
b@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_getfb@ge=
tfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms=
_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bm=
g-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2=
501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_plan=
e_cursor@viewport.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_cursor@viewport.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_plan=
e_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#=
2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142464v6/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bm=
g-4/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_pm_backlight@fa=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bm=
g-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_pm_r=
pm@system-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_p=
m_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-lifetime:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_prop=
_blob@blob-prop-lifetime.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_prop=
_blob@blob-prop-lifetime.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6=
/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v6/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-ful=
ly-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@k=
ms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-2/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@kms_psr@fbc-p=
sr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr=
@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@kms_psr@p=
sr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/sha=
rd-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bm=
g-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-b=
mg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE=
#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg=
-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904=
">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@kms_sy=
sfs_edid_timing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@kms_sys=
fs_edid_timing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@kms_vrr@flip-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4108">Intel XE#4108</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@kms_writ=
eback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@km=
s_writeback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_cop=
y_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt=
@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a=
>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@xe_eudeb=
ug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_eude=
bug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_eudeb=
ug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/i=
gt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_eud=
ebug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-436/igt@x=
e_eudebug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142464v6/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_exec_=
threads@threads-userptr-rebind-err.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-7/=
igt@xe_exec_threads@threads-userptr-rebind-err.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#417=
2</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-8/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-434/igt@xe_liv=
e_ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-434/igt@xe_live_ktest=
@xe_mocs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed59213=
2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed=
592132/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c48456=
43eed592132/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c=
4845643eed592132/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a=
4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df=
21b5a4ad0c4845643eed592132/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472=
e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606=
e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/sh=
ard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643eed5921=
32/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845643ee=
d592132/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4ad0c4845=
643eed592132/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21b5a4a=
d0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e23df21=
b5a4ad0c4845643eed592132/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7472e2=
3df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2555-9606e7=
472e23df21b5a4ad0c4845643eed592132/shard-adlp-4/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v6/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v6/shard-adlp-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v6/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shar=
d-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v6/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v6/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v6/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-adlp-4/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-dg2-436/igt@xe_oa@=
enable-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-dg2-466/igt@xe_oa@enable-d=
isable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-1/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-1/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-2/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_pm@s3=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/=
igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-8/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-4/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-4/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3=
/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v6/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132/shard-bmg-7/igt@xe_sriov=
_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v6/shard-bmg-3/igt@xe_srio=
v_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8209 -&gt; IGT_8210</li>
<li>Linux: xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132 -&gt; xe-pw-142=
464v6</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132: 9606e7472e23df21b5a4ad0=
c4845643eed592132<br />
  xe-pw-142464v6: 142464v6</p>

</body>
</html>

--===============6496214144854322665==--
