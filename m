Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAFBC54756
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 05:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D37F9B9E6;
	Thu, 22 May 2025 05:41:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1D9B370;
 Thu, 22 May 2025 05:33:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1550077417638340886=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dp=3A_Fix_the_ena?=
 =?utf-8?q?bling/disabling_of_audio_SDP_splitting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 05:33:55 -0000
Message-ID: <174789203522.12150.7362805342061740408@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142219.1688401-1-imre.deak@intel.com>
In-Reply-To: <20250520142219.1688401-1-imre.deak@intel.com>
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

--===============1550077417638340886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting (rev2)
URL   : https://patchwork.freedesktop.org/series/149254/
State : failure

== Summary ==

CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b_FULL -> xe-pw-149254v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149254v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149254v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149254v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][3] ([Intel XE#656]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-adlp:         [SKIP][5] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         [SKIP][7] ([Intel XE#362]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-adlp:         [SKIP][9] ([Intel XE#455]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  
Known issues
------------

  Here are the changes found in xe-pw-149254v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [PASS][11] -> [SKIP][12] ([Intel XE#4963])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#623])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][17], [SKIP][18]) ([Intel XE#2327])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#787]) +55 other tests ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#2907])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +202 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#787]) +11 other tests ( 2 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#3432])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][47] -> ([PASS][48], [INCOMPLETE][49]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][50], [INCOMPLETE][51]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test ( 1 incomplete, 1 pass )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#2887])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#306])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#373]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#2252])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([Intel XE#373])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_chamelium_frames@vga-frame-dump.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#373])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         [PASS][68] -> [SKIP][69] ([Intel XE#4950] / [Intel XE#4996]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_color@invalid-ctm-matrix-sizes.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][70] ([Intel XE#1178])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#1178])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1188])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#2320])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x85.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#308])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#2953] / [Intel XE#4173])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2291]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#2286])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][83] -> ([SKIP][84], [PASS][85]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#309])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][88] -> ([PASS][89], [FAIL][90]) ([Intel XE#1475])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#4494] / [i915#3804])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#3009])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_aux_dev.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> ([SKIP][95], [SKIP][96]) ([Intel XE#4331])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#2373])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#703])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> ([SKIP][100], [SKIP][101]) ([Intel XE#310])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@2x-busy-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2316]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][104] -> ([FAIL][105], [PASS][106]) ([Intel XE#301] / [Intel XE#3321])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][107] -> ([PASS][108], [FAIL][109]) ([Intel XE#301])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][110] -> ([PASS][111], [SKIP][112]) ([Intel XE#2316]) +5 other tests ( 1 pass, 1 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> ([PASS][113], [FAIL][114]) ([Intel XE#301])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#301]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][116] -> ([PASS][117], [DMESG-WARN][118]) ([Intel XE#2953] / [Intel XE#4173]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][119] -> ([PASS][120], [FAIL][121]) ([Intel XE#886])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> ([SKIP][122], [SKIP][123]) ([Intel XE#455]) +2 other tests ( 2 skip )
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][124], [SKIP][125]) ([Intel XE#455]) +4 other tests ( 2 skip )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#455]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][129], [SKIP][130]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#651])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#656]) +4 other tests ( 2 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#651]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#653]) +3 other tests ( 2 skip )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#2313]) +1 other test ( 2 skip )
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#653]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][145], [SKIP][146]) ([Intel XE#653]) +10 other tests ( 2 skip )
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][147] -> ([PASS][148], [SKIP][149]) ([Intel XE#455])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][150] -> ([PASS][151], [DMESG-WARN][152]) ([Intel XE#4173]) +5 other tests ( 1 dmesg-warn, 1 pass )
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][153] -> [SKIP][154] ([Intel XE#3012])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#2927])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][157] -> [DMESG-WARN][158] ([Intel XE#4173]) +5 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#4359])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][161] -> ([PASS][162], [SKIP][163]) ([Intel XE#4596])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#5021])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][166], [DMESG-WARN][167]) ([Intel XE#4212])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][168], [ABORT][169]) ([Intel XE#4760])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][172], [SKIP][173]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#2763]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][182], [SKIP][183]) ([Intel XE#870])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][184], [SKIP][185]) ([Intel XE#2938])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> ([SKIP][186], [SKIP][187]) ([Intel XE#2391])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][188], [SKIP][189]) ([Intel XE#908])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#1489])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#1489])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][193], [SKIP][194]) ([Intel XE#1489])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][195], [SKIP][196]) ([Intel XE#1489]) +4 other tests ( 2 skip )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1122])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#1122])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2234] / [Intel XE#2850]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#2850] / [Intel XE#929])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][204], [SKIP][205]) ([Intel XE#2850] / [Intel XE#929]) +4 other tests ( 2 skip )
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#3414])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#3414])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][211] -> ([SKIP][212], [PASS][213]) ([Intel XE#1499])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#756])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_eudebug@basic-client:
    - shard-bmg:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([Intel XE#4837])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_eudebug@basic-client.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-adlp:         NOTRUN -> ([SKIP][217], [SKIP][218]) ([Intel XE#4837])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#4837]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#4837]) +2 other tests ( 2 skip )
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> ([SKIP][222], [SKIP][223]) ([Intel XE#4519])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#688])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][226], [SKIP][227]) ([Intel XE#2322]) +1 other test ( 2 skip )
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#1392])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][230] -> ([SKIP][231], [PASS][232]) ([Intel XE#1392]) +11 other tests ( 1 pass, 1 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][233], [PASS][234]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#288]) +8 other tests ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - shard-adlp:         NOTRUN -> ([SKIP][237], [SKIP][238]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#288]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#4943])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - shard-adlp:         NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#4915]) +36 other tests ( 2 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_system_allocator@process-many-execqueues-free.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#4943]) +2 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][246], [SKIP][247]) ([Intel XE#4915]) +81 other tests ( 2 skip )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#4915]) +55 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][249] -> ([PASS][250], [FAIL][251]) ([Intel XE#5018])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#2541] / [Intel XE#3573]) +3 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#2541] / [Intel XE#3573])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         NOTRUN -> ([SKIP][255], [SKIP][256]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_oa@syncs-ufence-wait.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][257] -> ([ABORT][258], [PASS][259]) ([Intel XE#1794]) +3 other tests ( 1 abort, 1 pass )
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][260] -> ([PASS][261], [ABORT][262]) ([Intel XE#1794]) +2 other tests ( 1 abort, 1 pass )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#4733])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#4733])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#944])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#944])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#4130])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-adlp:         [PASS][270] -> [SKIP][271] ([Intel XE#4945]) +9 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][272] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][273], [PASS][274])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][275] ([Intel XE#2705] / [Intel XE#4212]) -> ([PASS][276], [PASS][277])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][278] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][280] ([Intel XE#3124]) -> ([PASS][281], [PASS][282])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][283] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][284], [PASS][285])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][286] ([Intel XE#2291]) -> [PASS][287] +3 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][288] ([Intel XE#2291]) -> ([PASS][289], [PASS][290]) +2 other tests ( 2 pass )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][291] ([Intel XE#4302]) -> ([PASS][292], [PASS][293])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][294] ([Intel XE#4294]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][296] ([Intel XE#2316]) -> ([PASS][297], [PASS][298])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][299] ([Intel XE#301]) -> ([PASS][300], [PASS][301])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][302] ([Intel XE#2316]) -> [PASS][303] +3 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][304] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][305] +2 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][306] ([Intel XE#2882]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][308] ([Intel XE#1503]) -> ([PASS][309], [PASS][310])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][311] ([Intel XE#1503]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1392]) -> ([PASS][314], [PASS][315]) +5 other tests ( 2 pass )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [ABORT][316] ([Intel XE#5087]) -> ([PASS][317], [PASS][318])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][319] ([Intel XE#1794]) -> ([PASS][320], [PASS][321])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][322] ([Intel XE#1794]) -> ([PASS][323], [PASS][324])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-adlp:         [SKIP][325] ([Intel XE#1124]) -> [SKIP][326] ([Intel XE#4996])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][327] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][328], [SKIP][329]) ([Intel XE#2314] / [Intel XE#2894])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][330] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][331] ([Intel XE#2351] / [Intel XE#4996])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][332] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][333] ([Intel XE#4996])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][334] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> ([PASS][335], [INCOMPLETE][336]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][337] ([Intel XE#1178]) -> ([FAIL][338], [SKIP][339]) ([Intel XE#1178] / [Intel XE#2341])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][340] ([Intel XE#2341]) -> [FAIL][341] ([Intel XE#1178])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_content_protection@srm.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][342] ([Intel XE#1188]) -> [SKIP][343] ([Intel XE#2341])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_content_protection@uevent.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         [SKIP][344] ([Intel XE#309]) -> [SKIP][345] ([Intel XE#4996]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][346] ([Intel XE#2291]) -> ([PASS][347], [SKIP][348]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][349] ([Intel XE#455]) -> [SKIP][350] ([Intel XE#4996])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         [SKIP][351] ([Intel XE#310]) -> [SKIP][352] ([Intel XE#4996])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][353] ([Intel XE#3321]) -> [SKIP][354] ([Intel XE#2316])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][355] ([Intel XE#301]) -> ([PASS][356], [FAIL][357]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][358] ([Intel XE#301] / [Intel XE#3321]) -> ([FAIL][359], [PASS][360]) ([Intel XE#301] / [Intel XE#3321])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][361] ([Intel XE#2316]) -> ([SKIP][362], [PASS][363]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][364] ([Intel XE#2882]) -> ([FAIL][365], [PASS][366]) ([Intel XE#2882]) +2 other tests ( 1 fail, 1 pass )
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][367] ([Intel XE#886]) -> ([PASS][368], [FAIL][369]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> ([SKIP][371], [SKIP][372]) ([Intel XE#2311]) +3 other tests ( 2 skip )
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][373] ([Intel XE#2311]) -> ([SKIP][374], [SKIP][375]) ([Intel XE#2311] / [Intel XE#2312]) +10 other tests ( 2 skip )
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][376] ([Intel XE#656]) -> [SKIP][377] ([Intel XE#4947])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][378] ([Intel XE#2312]) -> ([SKIP][379], [SKIP][380]) ([Intel XE#2311] / [Intel XE#2312]) +8 other tests ( 2 skip )
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [DMESG-FAIL][381] ([Intel XE#4543]) -> ([DMESG-FAIL][382], [DMESG-FAIL][383]) ([Intel XE#4173] / [Intel XE#4543])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][384] ([Intel XE#2312]) -> [SKIP][385] ([Intel XE#4141]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][386] ([Intel XE#4141]) -> ([SKIP][387], [SKIP][388]) ([Intel XE#2312] / [Intel XE#4141]) +7 other tests ( 2 skip )
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][389] ([Intel XE#2312]) -> ([SKIP][390], [SKIP][391]) ([Intel XE#4141])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][392] ([Intel XE#4141]) -> [SKIP][393] ([Intel XE#2312]) +4 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][394] ([Intel XE#2312]) -> ([SKIP][395], [SKIP][396]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][397] ([Intel XE#2312]) -> [SKIP][398] ([Intel XE#2311]) +12 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][399] ([Intel XE#2311]) -> [SKIP][400] ([Intel XE#2312]) +10 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-adlp:         [SKIP][401] ([Intel XE#651]) -> [SKIP][402] ([Intel XE#4947])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-adlp:         [SKIP][403] ([Intel XE#651]) -> [SKIP][404] ([Intel XE#4996])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][405] ([Intel XE#653]) -> [SKIP][406] ([Intel XE#4947])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][407] ([Intel XE#2312]) -> ([SKIP][408], [SKIP][409]) ([Intel XE#2313]) +2 other tests ( 2 skip )
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][410] ([Intel XE#2312]) -> [SKIP][411] ([Intel XE#2313]) +10 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][412] ([Intel XE#2313]) -> ([SKIP][413], [SKIP][414]) ([Intel XE#2312] / [Intel XE#2313]) +15 other tests ( 2 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][415] ([Intel XE#2313]) -> [SKIP][416] ([Intel XE#2312]) +13 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][417] ([Intel XE#2312]) -> ([SKIP][418], [SKIP][419]) ([Intel XE#2312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][420] ([Intel XE#1503]) -> ([PASS][421], [SKIP][422]) ([Intel XE#1503])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-swap.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_hdr@static-swap.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][423] ([Intel XE#4596]) -> [SKIP][424] ([Intel XE#5021])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][425] ([Intel XE#2571]) -> ([SKIP][426], [PASS][427]) ([Intel XE#2571])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@pr-sprite-render:
    - shard-adlp:         [SKIP][428] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][429] ([Intel XE#2351])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@pr-sprite-render.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#362]) -> ([SKIP][431], [SKIP][432]) ([Intel XE#1500])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         [SKIP][433] ([Intel XE#1062]) -> [SKIP][434] ([Intel XE#4945])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_create@create-big-vram.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         [SKIP][435] ([Intel XE#4837]) -> [SKIP][436] ([Intel XE#4945])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_eudebug@discovery-empty.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1392]) -> ([PASS][438], [SKIP][439]) ([Intel XE#1392])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
    - shard-adlp:         [SKIP][440] ([Intel XE#4915]) -> [SKIP][441] ([Intel XE#4945] / [Intel XE#4996]) +18 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         [INCOMPLETE][442] ([Intel XE#4911]) -> [TIMEOUT][443] ([Intel XE#4911])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-adlp:         [SKIP][444] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][445] ([Intel XE#4945])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-adlp:         [SKIP][446] ([Intel XE#4733]) -> [SKIP][447] ([Intel XE#4945])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -> xe-pw-149254v2

  IGT_8371: 8371
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331ca1180a9dd2b5560b
  xe-pw-149254v2: 149254v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/index.html

--===============1550077417638340886==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix the enabling/disabling of a=
udio SDP splitting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149254/">https://patchwork.freedesktop.org/series/149254/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd=
2b5560b_FULL -&gt; xe-pw-149254v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149254v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149254v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1492=
54v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.ht=
ml">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr=
@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@km=
s_psr@psr-sprite-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_til=
ed_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_vrr=
@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_=
vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149254v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@core_ho=
tunplug@unbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@core_hotunplug@unbind-=
rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-r=
otate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149254v2/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_bw@connected-linear-ti=
ling-3-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_bw@connected-line=
ar-tiling-3-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_bw@connected-linear=
-tiling-3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-dis=
plays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays=
-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-=
y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@ccs-on-=
another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-=
4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +202 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_ccs@cr=
c-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-=
yf-tiled-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#31=
13</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/421=
2">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4522">Intel XE#4522</a>) +1 other test ( 1 incomplete, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pi=
pe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4416">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-=
25.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel =
XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_chamelium_frames@dp-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cr=
c-planes-random.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-plan=
es-random.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_chamelium_frames@vga-fr=
ame-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd-after-=
suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-=
for-each-pipe.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each=
-pipe.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_col=
or@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_color@invali=
d-ctm-matrix-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random=
-256x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid=
-movement-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor=
_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@=
cursorb-vs-flipa-legacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-v=
s-flipb-atomic-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_cursor_legacy@curs=
orb-vs-flipb-atomic-transitions.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/=
igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE=
#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-pan=
el-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_dp_linktrain_fallback@d=
p-fallback.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@2x-busy-flip.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14925=
4v2/shard-adlp-1/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6=
-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interrup=
tible@ab-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6=
-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interrup=
tible@ac-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_fli=
p@2x-wf_vblank-ts-check-interruptible.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-=
wf_vblank-ts-check-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tes=
ts ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-v=
blank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel X=
E#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4173">Intel XE#4173</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblan=
k-ts-check@b-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-ed=
p1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip_=
scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-=
433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pip=
e-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer=
_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuf=
fer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_front=
buffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2=
/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_inv=
alid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms=
_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_i=
nvalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">DMESG-WARN</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
>) +5 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_joiner@basic-ultra-joi=
ner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Int=
el XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pipe_stress@stress-xrg=
b8888-ytiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-yti=
led.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane_multiple=
@2x-tiling-none.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_multiple@2x-tili=
ng-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">I=
ntel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-dp-4.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_plane_scaling@i=
ntel-max-src-size@pipe-a-dp-4.html">DMESG-WARN</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-hdmi-a-6.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_plane_scaling@in=
tel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-pixel-format.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_=
scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms=
_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
63">Intel XE#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-25.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25@pipe-b.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_plane_=
scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Inte=
l XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpm=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel=
 XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr2_sf@pr-overla=
y-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_psr2_sf=
@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Int=
el XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_psr@fbc-pr-sprite-plane-=
onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-blt=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
29">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-pl=
ane-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_psr@psr2-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_rotation_crc@bad-pixel=
-format.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149254v2/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#=
3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_vrr@negative-basic.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-bmg-7/igt@kms_vrr@negative-basic.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_eudebug@basic-client.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-bmg-3/igt@xe_eudebug@basic-client.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_eudebug@basic-vm-access-user=
ptr-faultable.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_eudebug_online@interrup=
t-all-set-breakpoint.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_eudebug_online@interrupt=
-all-set-breakpoint.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-adlp-1/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#=
4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcomm=
it-parallel-nofree-samefd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_evict_ccs@evict-over=
commit-parallel-nofree-samefd.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_exec_basic@mu=
ltigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-e=
xec-bindexecqueue-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_basic@multigpu-n=
o-exec-bindexecqueue-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
+11 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-onc=
e-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu=
-once-userptr-invalidate-race.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test (=
 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-b=
indexecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_exec_fault_mo=
de@twice-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-re=
bind-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-rebind-imm.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/288">Intel XE#288</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-new-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_exec_system_allocato=
r@many-execqueues-mmap-new-huge.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_exec_system_allocator@pr=
ocess-many-execqueues-free.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_exec_system_allocat=
or@process-many-execqueues-free.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +36 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-new-huge.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_exec_s=
ystem_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Inte=
l XE#4943</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_system_allocator@t=
hreads-many-malloc-multi-fault.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_exec_system_al=
locator@threads-many-malloc-multi-fault.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +81 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +55 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large=
-new-bo-map-nomemset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-lnl-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_oa@rc6-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Int=
el XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#179=
4</a>) +3 other tests ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbin=
d-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Int=
el XE#1794</a>) +2 other tests ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_pxp@display-black-pxp-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-dg2-433/igt@xe_pxp@display-pxp-fb.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_query@multigpu-query-gt=
-list.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_query@multigpu-query-top=
ology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@=
fair-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_vm@m=
unmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_vm@munmap-=
style-unbind-one-partial.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +9 other tests skip</=
li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-=
b-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-cc=
s@pipe-b-dp-4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">PASS</a>) +2 other tests ( 2 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/ig=
t@kms_display_modes@extended-mode-basic.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_displa=
y_modes@extended-mode-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14925=
4v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e@cd-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip=
@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@wf=
_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_hdr@sta=
tic-toggle-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@x=
e_exec_basic@multigpu-once-null.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@mu=
ltigpu-once-null.html">PASS</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_modul=
e_load@reload-no-display.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_m=
odule_load@reload-no-display.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_module_load@reload=
-no-display.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_pm@s4-=
vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.htm=
l">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_pm@s4-v=
m-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html">PAS=
S</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@km=
s_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs=
@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996=
">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data=
-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_=
content_protection@lic-type-0.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_content_protecti=
on@lic-type-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cur=
sor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_dir=
tyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fli=
p@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e@bc-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test =
( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel=
 XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard=
-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel=
 XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip=
@plain-flip-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2882">Intel XE#2882</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_f=
lip@wf_vblank-ts-check@a-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-t=
s-check@a-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pr=
imscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgfli=
p-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-in=
dfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgfli=
p-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-in=
dfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@kms_frontbuffer_trac=
king@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sha=
rd-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">=
Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-a=
dlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-in=
dfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_hdr@static-swa=
p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane=
_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr=
@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@=
kms_psr@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_crea=
te@create-big-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1062">Intel XE#1062</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_create@c=
reate-big-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_eude=
bug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_eudebug=
@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2=
-434/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/=
igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec=
_system_allocator@threads-many-large-mmap-shared-remap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4=
915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49254v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-mmap-s=
hared-remap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4=
911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49254v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send=
_recv.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@i=
nvalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_pxp@=
pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -&gt; xe-pw-149=
254v2</li>
</ul>
<p>IGT_8371: 8371<br />
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331=
ca1180a9dd2b5560b<br />
  xe-pw-149254v2: 149254v2</p>

</body>
</html>

--===============1550077417638340886==--
