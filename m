Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09EAD262B0
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 06:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EFF10E6BF;
	Wed, 21 Jan 2026 06:36:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E8410E6BF;
 Wed, 21 Jan 2026 06:36:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3894942530975869509=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Account_for_DSC_bubble_ove?=
 =?utf-8?q?rhead_for_horizontal_slices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 06:36:56 -0000
Message-ID: <176897741641.175659.4480195700379736587@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121035330.2793386-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260121035330.2793386-1-ankit.k.nautiyal@intel.com>
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

--===============3894942530975869509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Account for DSC bubble overhead for horizontal slices (rev3)
URL   : https://patchwork.freedesktop.org/series/152803/
State : failure

== Summary ==

CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL -> xe-pw-152803v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152803v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152803v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152803v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][5] -> [CRASH][6] +1 other test crash
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [PASS][7] -> [SKIP][8] +350 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_vblank@query-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_vblank@query-forked.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-lnl:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@xe_pxp@display-black-pxp-fb.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@xe_pxp@display-black-pxp-fb.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][11] ([Intel XE#5993]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [FAIL][13] ([Intel XE#6054]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][15] ([Intel XE#664]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][17] ([Intel XE#3279]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][19] ([Intel XE#3658]) -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][21] ([Intel XE#1407]) -> [SKIP][22] +25 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][23] ([Intel XE#7059]) -> [SKIP][24] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][25] ([Intel XE#1477]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][27] ([Intel XE#1428]) -> [SKIP][28] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][29] ([Intel XE#1467]) -> [SKIP][30] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][31] ([Intel XE#1124]) -> [SKIP][32] +57 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          [SKIP][33] ([Intel XE#2191]) -> [SKIP][34] +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][35] ([Intel XE#1512]) -> [SKIP][36] +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][37] ([Intel XE#367]) -> [SKIP][38] +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][39] ([Intel XE#2887]) -> [SKIP][40] +85 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][41] ([Intel XE#2669] / [Intel XE#3433]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][43] ([Intel XE#3432]) -> [SKIP][44] +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][45] ([Intel XE#2669]) -> [SKIP][46] +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][47] ([Intel XE#4417]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_cdclk@mode-transition.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][49] ([Intel XE#4418]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][51] ([Intel XE#4416]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_cdclk@plane-scaling.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-lnl:          [FAIL][53] ([Intel XE#6968]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][55] ([Intel XE#6974]) -> [SKIP][56] +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][57] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][58] +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-lnl:          [SKIP][59] ([Intel XE#6973]) -> [SKIP][60] +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_content_protection@legacy-hdcp14.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][61] ([Intel XE#1468]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_content_protection@mei-interface.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][63] ([Intel XE#6705]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_content_protection@suspend-resume.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][65] ([Intel XE#3278]) -> [SKIP][66] +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_content_protection@uevent.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          [SKIP][67] ([Intel XE#2321]) -> [SKIP][68] +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][69] ([Intel XE#1424]) -> [SKIP][70] +28 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          [SKIP][71] ([Intel XE#309]) -> [SKIP][72] +25 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][73] ([Intel XE#323]) -> [SKIP][74] +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][75] ([Intel XE#4302]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][77] ([Intel XE#4354]) -> [SKIP][78] +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][79] ([Intel XE#4331]) -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][81] ([Intel XE#2244]) -> [SKIP][82] +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][83] ([Intel XE#4422]) -> [SKIP][84] +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          [SKIP][85] ([Intel XE#1397]) -> [SKIP][86] +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][87] ([Intel XE#6312]) -> [SKIP][88] +10 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][89] ([Intel XE#7061]) -> [SKIP][90] +26 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [DMESG-WARN][91] ([Intel XE#7063]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][93] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][95] ([Intel XE#1503]) -> [SKIP][96] +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][97] ([Intel XE#6912]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][99] ([Intel XE#4329] / [Intel XE#6912]) -> [SKIP][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][101] ([Intel XE#599]) -> [SKIP][102] +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][103] ([Intel XE#4596]) -> [SKIP][104] +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][105] ([Intel XE#5020]) -> [SKIP][106] +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][107] ([Intel XE#2029]) -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][109] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][110] +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][111] ([Intel XE#1127]) -> [SKIP][112] +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][113] ([Intel XE#362]) -> [SKIP][114] +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-lnl:          [FAIL][115] ([Intel XE#4459]) -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@cmrr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          [FAIL][117] ([Intel XE#6390]) -> [SKIP][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@lobf.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][119] ([Intel XE#1499]) -> [SKIP][120] +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@negative-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-lnl:          [FAIL][121] ([Intel XE#2142]) -> [SKIP][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  
New tests
---------

  New tests have been introduced between xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL and xe-pw-152803v3_FULL:

### New IGT tests (1) ###

  * igt@kms_properties@connector-properties-atomic@pipe-none-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-152803v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#6779])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@fbdev@read:
    - shard-lnl:          [PASS][125] -> [SKIP][126] ([Intel XE#2134]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@fbdev@read.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@fbdev@read.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2327])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1124]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#367]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2887]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2252]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_color@ctm-negative:
    - shard-lnl:          [PASS][132] -> [SKIP][133] ([Intel XE#3297]) +12 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_color@ctm-negative.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_color@ctm-negative.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [PASS][134] -> [SKIP][135] ([Intel XE#1511] / [Intel XE#3297])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_color@deep-color.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2390] / [Intel XE#6974])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2320]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [FAIL][138] ([Intel XE#5299])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#5545]) +1 other test dmesg-fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_feature_discovery@display-1x:
    - shard-lnl:          [PASS][141] -> [SKIP][142] ([Intel XE#702])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_feature_discovery@display-1x.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][143] -> [SKIP][144] ([Intel XE#2482]) +43 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][145] -> [SKIP][146] ([Intel XE#6703]) +95 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2293] / [Intel XE#2380])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2293]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [PASS][149] -> [SKIP][150] ([Intel XE#1745]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#7064] / [Intel XE#7081])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#7064])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [PASS][153] -> [SKIP][154] ([Intel XE#2682])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2311]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#7061])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4141]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [PASS][158] -> [SKIP][159] ([Intel XE#2548]) +109 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2313]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][161] -> [SKIP][162] ([Intel XE#2568]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_invalid_mode@uint-max-clock.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][163] -> [SKIP][164] ([Intel XE#3307])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_plane_scaling@invalid-num-scalers.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][165] -> [SKIP][166] ([Intel XE#6886]) +81 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [PASS][167] -> [SKIP][168] ([Intel XE#870]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pm_backlight@basic-brightness.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          [PASS][169] -> [SKIP][170] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [PASS][171] -> [SKIP][172] ([Intel XE#1439] / [Intel XE#836]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [PASS][174] -> [SKIP][175] ([Intel XE#1406] / [Intel XE#1489]) +12 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][177] -> [SKIP][178] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +36 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#1406] / [Intel XE#2414])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-lnl:          [PASS][180] -> [SKIP][181] ([Intel XE#1406])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][182] -> [SKIP][183] ([Intel XE#1435])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_setmode@basic.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_setmode@basic.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#6503])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#1499])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#4837]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2322]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#6874]) +8 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][190] -> [DMESG-WARN][191] ([Intel XE#7023])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#5007])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#4943]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][194] -> [ABORT][195] ([Intel XE#1727])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@xe_module_load@many-reload.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#6964]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][197] ([Intel XE#6904]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][199] ([Intel XE#5299]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][201] ([Intel XE#7030]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [DMESG-FAIL][203] ([Intel XE#5545]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128:
    - shard-bmg:          [ABORT][205] ([Intel XE#5545]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-3/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128.html

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:
    - shard-bmg:          [FAIL][207] -> [PASS][208] +2 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-3/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [SKIP][209] ([Intel XE#6693]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#6321]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - shard-bmg:          [SKIP][213] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-free:
    - shard-bmg:          [INCOMPLETE][215] -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-free.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [PASS][218] +69 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][219] ([Intel XE#7024]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][221] ([Intel XE#2327]) -> [SKIP][222] ([Intel XE#6703])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#2327])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][225] ([Intel XE#6703]) -> [SKIP][226] ([Intel XE#1124]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][227] ([Intel XE#1124]) -> [SKIP][228] ([Intel XE#6703]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][229] ([Intel XE#6703]) -> [SKIP][230] ([Intel XE#2314] / [Intel XE#2894])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][231] ([Intel XE#367]) -> [SKIP][232] ([Intel XE#6703])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][233] ([Intel XE#2887]) -> [SKIP][234] ([Intel XE#6703]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][235] ([Intel XE#3432]) -> [SKIP][236] ([Intel XE#6703])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][237] ([Intel XE#2252]) -> [SKIP][238] ([Intel XE#6703])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][239] ([Intel XE#6703]) -> [SKIP][240] ([Intel XE#2252])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [FAIL][241] ([Intel XE#6968]) -> [SKIP][242] ([Intel XE#7006]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][243] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][244] ([Intel XE#7006])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][245] ([Intel XE#6974]) -> [SKIP][246] ([Intel XE#6703])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][247] ([Intel XE#6703]) -> [SKIP][248] ([Intel XE#2390] / [Intel XE#6974])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][249] ([Intel XE#2321]) -> [SKIP][250] ([Intel XE#6703])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][251] ([Intel XE#6703]) -> [SKIP][252] ([Intel XE#2374])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][253] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][254] ([Intel XE#1745]) +7 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][255] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][256] ([Intel XE#6703])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][257] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][258] ([Intel XE#1745]) +25 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][259] ([Intel XE#6703]) -> [SKIP][260] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][261] ([Intel XE#2311]) -> [SKIP][262] ([Intel XE#6703]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][263] ([Intel XE#6703]) -> [SKIP][264] ([Intel XE#2311]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#4141])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#4141]) -> [SKIP][268] ([Intel XE#6703]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][269] ([Intel XE#651]) -> [SKIP][270] ([Intel XE#2548]) +71 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][271] ([Intel XE#1469]) -> [SKIP][272] ([Intel XE#2548]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][273] ([Intel XE#2313]) -> [SKIP][274] ([Intel XE#6703]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [DMESG-WARN][275] ([Intel XE#7063]) -> [SKIP][276] ([Intel XE#2548])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#6703]) -> [SKIP][278] ([Intel XE#2313]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][279] ([Intel XE#656]) -> [SKIP][280] ([Intel XE#2548]) +226 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][281] ([Intel XE#7061]) -> [SKIP][282] ([Intel XE#6703])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][283] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][284] ([Intel XE#3544])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][285] ([Intel XE#1450] / [Intel XE#2568]) -> [SKIP][286] ([Intel XE#2568])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][287] ([Intel XE#2938]) -> [SKIP][288] ([Intel XE#6703])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][289] ([Intel XE#736]) -> [SKIP][290] ([Intel XE#1909])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][291] ([Intel XE#6703]) -> [SKIP][292] ([Intel XE#2392])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][293] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) -> [SKIP][294] ([Intel XE#1406] / [Intel XE#1489]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][295] ([Intel XE#1406] / [Intel XE#2893]) -> [SKIP][296] ([Intel XE#1406] / [Intel XE#1489]) +22 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][297] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][298] ([Intel XE#1406] / [Intel XE#1489])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][299] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][300] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][301] ([Intel XE#1406]) -> [SKIP][302] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +36 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][303] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][304] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][305] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][306] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_psr@psr-primary-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][307] ([Intel XE#1406] / [Intel XE#4692]) -> [SKIP][308] ([Intel XE#1406])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][309] ([Intel XE#2413]) -> [SKIP][310] ([Intel XE#6703])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][311] ([Intel XE#2509]) -> [SKIP][312] ([Intel XE#2426])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][313] ([Intel XE#2168]) -> [SKIP][314] ([Intel XE#6703])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_vrr@lobf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][315] ([Intel XE#6703]) -> [SKIP][316] ([Intel XE#4837]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          [SKIP][317] ([Intel XE#4837]) -> [SKIP][318] ([Intel XE#6703])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug@basic-vm-bind.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][319] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][320] ([Intel XE#6703])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug_online@pagefault-read-stress.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][321] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][322] ([Intel XE#6703])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][323] ([Intel XE#2322]) -> [SKIP][324] ([Intel XE#6703]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][325] ([Intel XE#6703]) -> [SKIP][326] ([Intel XE#2322])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          [SKIP][327] ([Intel XE#6874]) -> [SKIP][328] ([Intel XE#6703]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:
    - shard-bmg:          [SKIP][329] ([Intel XE#6703]) -> [SKIP][330] ([Intel XE#6874]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - shard-bmg:          [SKIP][331] ([Intel XE#6703]) -> [SKIP][332] ([Intel XE#4943]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          [SKIP][333] ([Intel XE#4943]) -> [SKIP][334] ([Intel XE#6703]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][335] ([Intel XE#579]) -> [SKIP][336] ([Intel XE#6703])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [FAIL][337] ([Intel XE#5937]) -> [SKIP][338] ([Intel XE#6703])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6973]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#7030]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7064]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064
  [Intel XE#7081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -> xe-pw-152803v3

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e
  xe-pw-152803v3: 152803v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html

--===============3894942530975869509==
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
<tr><td><b>Series:</b></td><td>Account for DSC bubble overhead for horizontal slices (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152803/">https://patchwork.freedesktop.org/series/152803/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL -&gt; xe-pw-152803v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152803v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152803v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152803v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo@all-pipes.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_vblank@query-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_vblank@query-forked.html">SKIP</a> +350 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@xe_pxp@display-black-pxp-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@xe_pxp@display-black-pxp-fb.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_cdclk@mode-transition.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968">Intel XE#6968</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_content_protection@mei-interface.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_content_protection@suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_content_protection@uevent.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@cmrr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_vrr@cmrr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@lobf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390">Intel XE#6390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_vrr@lobf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_vrr@negative-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL and xe-pw-152803v3_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_properties@connector-properties-atomic@pipe-none-edp-1:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152803v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_feature_discovery@display-1x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081">Intel XE#7081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_module_load@many-reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904">Intel XE#6904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030">Intel XE#7030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-3/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-3/igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-free.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html">PASS</a> +69 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024">Intel XE#7024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968">Intel XE#6968</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +226 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -&gt; xe-pw-152803v3</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e<br />
  xe-pw-152803v3: 152803v3</p>

</body>
</html>

--===============3894942530975869509==--
