Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C32C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 02:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124210E3EC;
	Fri, 18 Apr 2025 02:47:15 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E2710E3EC;
 Fri, 18 Apr 2025 02:47:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8191691771987659806=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_LOBF_enablement_fix_=28rev?=
 =?utf-8?q?8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 02:47:13 -0000
Message-ID: <174494443385.16971.3934110864901578630@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417094123.1662424-1-animesh.manna@intel.com>
In-Reply-To: <20250417094123.1662424-1-animesh.manna@intel.com>
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

--===============8191691771987659806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: LOBF enablement fix (rev8)
URL   : https://patchwork.freedesktop.org/series/142278/
State : failure

== Summary ==

CI Bug Log - changes from xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6_FULL -> xe-pw-142278v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142278v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142278v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142278v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][4] -> [ABORT][5] +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#455]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  
Known issues
------------

  Here are the changes found in xe-pw-142278v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3767]) +15 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3658])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#3428]) +4 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +155 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4417]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#3278])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#1178])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#3304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4302])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#4494] / [Intel XE#455])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2244])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2373])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#310]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#301])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#2882])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#2882])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2293]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#656]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4141]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#651]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2313]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#455]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1503])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2486])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#616])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#4596])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#4596])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2571])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#309]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2763]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1439] / [Intel XE#836])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1489]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_psr@pr-cursor-render.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1435])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#1435]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][96] ([Intel XE#4212])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-adlp:         [PASS][97] -> [DMESG-WARN][98] ([Intel XE#4173]) +5 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-8/igt@kms_universal_plane@universal-plane-functional.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-2/igt@kms_universal_plane@universal-plane-functional.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#1499])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#756])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2905]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2905]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2322]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1392]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#288]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_oa@enable-disable@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#4804])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_oa@enable-disable@rcs-0.html
    - shard-lnl:          NOTRUN -> [FAIL][111] ([Intel XE#4804])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_oa@enable-disable@rcs-0.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2284])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1948])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4650])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4733])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4130])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4130])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-lnl:          [ABORT][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][120] ([Intel XE#4543]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2191]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][124] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#3862]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][128] ([Intel XE#2291]) -> [PASS][129] +6 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#309]) -> [PASS][131] +4 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#310]) -> [PASS][133] +9 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][134] ([Intel XE#3321]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][136] ([Intel XE#2316]) -> [PASS][137] +5 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#301]) -> [PASS][139] +2 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][140] ([Intel XE#301]) -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#656]) -> [PASS][143] +13 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#4328]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          [SKIP][146] ([Intel XE#3012]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][148] -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#836]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][152] ([Intel XE#1435]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-bmg:          [DMESG-WARN][156] ([Intel XE#3428]) -> [PASS][157] +5 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1392]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#4173]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][162] ([Intel XE#4541]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-8/igt@xe_oa@buffer-size.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-4/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][164] ([Intel XE#1794]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-2/igt@xe_pm@s4-basic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#787]) +20 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#787]) -> [SKIP][169] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#1178]) -> [SKIP][171] ([Intel XE#455])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#455]) -> [FAIL][173] ([Intel XE#1178])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [SKIP][174] ([Intel XE#2341]) -> [FAIL][175] ([Intel XE#1178])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][176] ([i915#3804]) -> [SKIP][177] ([Intel XE#4494] / [Intel XE#455] / [i915#3804])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][178] ([Intel XE#3321]) -> [SKIP][179] ([Intel XE#2316])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#301]) -> [SKIP][181] ([Intel XE#310])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][182] ([Intel XE#2311]) -> [SKIP][183] ([Intel XE#2312]) +15 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#656]) -> [SKIP][185] ([Intel XE#651]) +24 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][186] ([Intel XE#2312]) -> [SKIP][187] ([Intel XE#4141]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][188] ([Intel XE#4141]) -> [SKIP][189] ([Intel XE#2312]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][190] ([Intel XE#2312]) -> [SKIP][191] ([Intel XE#2311]) +15 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#651]) -> [SKIP][193] ([Intel XE#656]) +19 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][194] ([Intel XE#2313]) -> [SKIP][195] ([Intel XE#2312]) +15 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][196] ([Intel XE#2312]) -> [SKIP][197] ([Intel XE#2313]) +15 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#656]) -> [SKIP][199] ([Intel XE#653]) +18 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#653]) -> [SKIP][201] ([Intel XE#656]) +20 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][202] ([Intel XE#4596]) -> [SKIP][203] ([Intel XE#2493]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#4596]) -> [SKIP][205] ([Intel XE#455])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#362]) -> [FAIL][207] ([Intel XE#1729])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][208] ([Intel XE#2509]) -> [SKIP][209] ([Intel XE#2426])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][210], [PASS][211], [PASS][212], [SKIP][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235]) ([Intel XE#2457]) -> ([PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [SKIP][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [DMESG-WARN][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261]) ([Intel XE#2457] / [Intel XE#3428])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][262] ([Intel XE#1794]) -> [ABORT][263] ([Intel XE#2953])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6 -> xe-pw-142278v8

  IGT_8326: 8326
  xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcba1e51b42899ff57f6
  xe-pw-142278v8: 142278v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/index.html

--===============8191691771987659806==
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
<tr><td><b>Series:</b></td><td>LOBF enablement fix (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142278/">https://patchwork.freedesktop.org/series/142278/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142278v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142278v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2967-830407db6fa5a871d1a6fcba1e51b4289=
9ff57f6_FULL -&gt; xe-pw-142278v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142278v8_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142278v8_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1422=
78v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg=
-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DM=
ESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-4/igt@kms_vbla=
nk@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-8/ig=
t@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">ABORT</a> +1 o=
ther test abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@xe_ccs@block-copy-compresse=
d-inc-dimension.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@invalid-clone-single-crtc-stealing:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg=
2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">ABORT</a></l=
i>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142278v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-a=
dlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +4 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +155 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_flip@2x=
-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_fl=
ip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_=
flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-4=
33/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-6/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_flip=
@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_fli=
p@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_flip@plain-flip-fb-recrea=
te-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_pl=
ane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@kms_plane_=
scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_psr@pr-cursor-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-8/igt@kms_uni=
versal_plane@universal-plane-functional.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-2/igt@kms_=
universal_plane@universal-plane-functional.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefet=
ch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_oa@enable-disable@rcs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_oa@enable-disable@rcs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pmu@all-fn-engine-activity=
-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-5/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries-display-on.html">ABORT</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl=
-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142278v8/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/=
shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142278v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-b=
mg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +6 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436=
/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> +4 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2=
-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> +9 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/sha=
rd-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278=
v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-mov=
e.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_jo=
iner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@k=
ms_joiner@basic-force-big-joiner.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-x@pipe-a-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@kms_p=
lane_lowres@tiling-x@pipe-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-436/igt@kms_pm_rp=
m@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8=
/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_evict=
_ccs@evict-overcommit-standalone-nofree-reopen.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#342=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
278v8/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reope=
n.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v=
8/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142278v8/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-fu=
nction-xe_tile_init_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-8/igt@xe_oa@bu=
ffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4541">Intel XE#4541</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-4/igt@xe_oa@buffer-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142278v8/shard-lnl-1/igt@xe_pm@s4-basic.html">PA=
SS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142278v8/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2278v8/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-432/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-464/igt@=
kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms=
_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shar=
d-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">In=
tel XE#4494</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-=
bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-=
dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142278v8/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
78v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142278v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2278v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142278v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
78v8/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
78v8/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278=
v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) +1 other test skip</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-463/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-dg2-432/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-7=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff=
57f6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b428=
99ff57f6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51=
b42899ff57f6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba=
1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6=
fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871=
d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5=
a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-830407db=
6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-8304=
07db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2967-=
830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f=
6/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42278v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142278v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42278v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42278v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42278v8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-6/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/s=
hard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142278v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142278v8/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6/shard-adlp-9/igt@xe_pm@s=
4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142278v8/shard-adlp-9/igt@xe_pm@s4-mul=
tiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6 -&gt; xe-pw-142=
278v8</li>
</ul>
<p>IGT_8326: 8326<br />
  xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcb=
a1e51b42899ff57f6<br />
  xe-pw-142278v8: 142278v8</p>

</body>
</html>

--===============8191691771987659806==--
