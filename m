Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E331BC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 04:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1010EBF8;
	Fri, 28 Feb 2025 04:44:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B5A10EBF8;
 Fri, 28 Feb 2025 04:44:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7801620355796132668=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improve_type-safety_on_POW?=
 =?utf-8?q?ER=5FDOMAIN=5F*=28=29_macros_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 04:44:34 -0000
Message-ID: <174071787466.3042998.14533074930593599228@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227-improve-type-safey-power-domain-macros-v3-0-b6eaa00f9c33@intel.com>
In-Reply-To: <20250227-improve-type-safey-power-domain-macros-v3-0-b6eaa00f9c33@intel.com>
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

--===============7801620355796132668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve type-safety on POWER_DOMAIN_*() macros (rev4)
URL   : https://patchwork.freedesktop.org/series/144727/
State : failure

== Summary ==

CI Bug Log - changes from xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4_full -> xe-pw-144727v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144727v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144727v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144727v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  
Known issues
------------

  Here are the changes found in xe-pw-144727v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#4330])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +133 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#2705]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2724])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][22] ([Intel XE#4330])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#1178])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2321])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#309])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2291])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4210])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#4294])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2244])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1135])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2316]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#301] / [Intel XE#3321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#4330]) +17 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#310]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2316]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#886]) +5 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#301]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a2:
    - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#2049]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_flip@flip-vs-rmfb@b-hdmi-a2.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_flip@flip-vs-rmfb@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][56] -> [DMESG-WARN][57] ([Intel XE#2955])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2293]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#656]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4141]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2312]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#653]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2340])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2486])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2:
    - shard-bmg:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#4330]) +3 other tests dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2493])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][73] ([Intel XE#2566] / [Intel XE#4212]) +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#2566] / [Intel XE#4330])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2763]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#870])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#836])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1489]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_psr@psr-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3414] / [Intel XE#3904])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2330])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][87] -> [DMESG-WARN][88] ([Intel XE#4330]) +4 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#756])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#756])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2905]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2905]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2322]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#1392]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#288]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#586])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2457])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_oa@oa-formats.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2284])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#4173]) +4 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [PASS][103] -> [DMESG-WARN][104] ([Intel XE#2953])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][105] -> [DMESG-WARN][106] ([Intel XE#4330] / [Intel XE#569])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][107] ([Intel XE#4330] / [Intel XE#569])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_pm@s3-exec-after.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#944]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4130])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#3342])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-adlp:         [DMESG-WARN][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-999.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#4330]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#2705] / [Intel XE#3113]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][117] ([Intel XE#4330]) -> [PASS][118] +8 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-dg2-set2:     [DMESG-WARN][119] ([Intel XE#4330]) -> [PASS][120] +9 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][121] ([Intel XE#2291]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#309]) -> [PASS][124] +3 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][125] ([Intel XE#1340]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#4331]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#310]) -> [PASS][130] +3 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][131] ([Intel XE#2316]) -> [PASS][132] +6 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#301]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][135] ([Intel XE#2882]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [FAIL][137] ([Intel XE#886]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][139] ([Intel XE#4330]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][141] ([Intel XE#1874]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#656]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#3970]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-4/igt@kms_hdmi_inject@inject-4k.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#616]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#836]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][153] ([Intel XE#899]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1392]) -> [PASS][156] +2 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#4173]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#787]) -> [SKIP][160] ([Intel XE#455] / [Intel XE#787])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][162] ([Intel XE#787]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#2705] / [Intel XE#3113]) -> [DMESG-WARN][164] ([Intel XE#4330])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][165] ([Intel XE#1178]) -> [SKIP][166] ([Intel XE#2341])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_content_protection@atomic.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#455]) -> [FAIL][168] ([Intel XE#1178])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_content_protection@srm.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#1188]) -> [SKIP][170] ([Intel XE#455])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_content_protection@uevent.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#4330]) -> [SKIP][172] ([Intel XE#309]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][173] ([Intel XE#2291]) -> [DMESG-WARN][174] ([Intel XE#877])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#2955]) -> [SKIP][176] ([Intel XE#310])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][177] ([Intel XE#2311]) -> [SKIP][178] ([Intel XE#2312]) +18 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][179] ([Intel XE#2312]) -> [SKIP][180] ([Intel XE#2311]) +9 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][181] ([Intel XE#2312]) -> [SKIP][182] ([Intel XE#4141]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#4141]) -> [SKIP][184] ([Intel XE#2312]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#656]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#656]) -> [SKIP][188] ([Intel XE#651]) +12 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2313]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#656]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#656]) -> [SKIP][194] ([Intel XE#653]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][195] ([Intel XE#2313]) -> [SKIP][196] ([Intel XE#2312]) +20 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][197] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][198] ([Intel XE#3544])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1500]) -> [SKIP][200] ([Intel XE#362])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][201] ([Intel XE#4054]) -> [ABORT][202] ([Intel XE#4268])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4 -> xe-pw-144727v4

  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4: e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4
  xe-pw-144727v4: 144727v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/index.html

--===============7801620355796132668==
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
<tr><td><b>Series:</b></td><td>Improve type-safety on POWER_DOMAIN_*() macros (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144727/">https://patchwork.freedesktop.org/series/144727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4_full -&gt; xe-pw-144727v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144727v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144727v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144727v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144727v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_flip@flip-vs-rmfb@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_flip@flip-vs-rmfb@b-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-999.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-6/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-128x128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-128x128.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-4/igt@kms_hdmi_inject@inject-4k.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-1/igt@kms_hdmi_inject@inject-4k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054">Intel XE#4054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v4/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4 -&gt; xe-pw-144727v4</li>
</ul>
<p>IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4: e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4<br />
  xe-pw-144727v4: 144727v4</p>

</body>
</html>

--===============7801620355796132668==--
