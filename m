Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB043CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 06:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB410EB4B;
	Fri, 29 Aug 2025 06:32:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9DE10EB4A;
 Fri, 29 Aug 2025 06:32:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6298413792105536532=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E49=2E4_for_BMG=2C_LNL=2C_PTL=2C_PVC_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 06:32:01 -0000
Message-ID: <175644912143.283062.949899277724282764@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828200937.362797-2-julia.filipchuk@intel.com>
In-Reply-To: <20250828200937.362797-2-julia.filipchuk@intel.com>
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

--===============6298413792105536532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.49.4 for BMG, LNL, PTL, PVC (rev4)
URL   : https://patchwork.freedesktop.org/series/153535/
State : failure

== Summary ==

CI Bug Log - changes from xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97_FULL -> xe-pw-153535v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153535v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153535v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153535v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][1] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][2] ([Intel XE#911]) -> [FAIL][3] +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#4208]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@buffer-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-adlp:         [SKIP][6] ([Intel XE#5103]) -> [SKIP][7] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@xe_oa@mmio-triggered-reports-read.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@xe_oa@mmio-triggered-reports-read.html

  
Known issues
------------

  Here are the changes found in xe-pw-153535v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#2134]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@fbdev@write.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#4208] / [i915#2575]) +77 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3279])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][13] -> [FAIL][14] ([Intel XE#3908]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3658])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#619])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1467])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2328]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#607])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#787]) +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +16 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +195 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#3432])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#2907])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#5376]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2669]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#5941])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#3124])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1727] / [Intel XE#3113])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2724]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4417]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4416]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#306])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2325]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#306])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#373]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#373]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2252]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#373]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#1178])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1178]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2341])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1188])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2320]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1424])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#308])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#309]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2291]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#309]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#5354])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4302])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1340])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4354])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#4354])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#4354])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4354])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2316]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#4543] / [Intel XE#5208]) +1 other test dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][89] -> [INCOMPLETE][90] ([Intel XE#2049] / [Intel XE#2597])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][95] ([Intel XE#2049] / [Intel XE#2597])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][96] -> [DMESG-WARN][97] ([Intel XE#4543]) +15 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#4208]) +179 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#455]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1397]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][107] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#455]) +10 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2311]) +30 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#651]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#4208]) +121 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#651]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][113] ([Intel XE#4543]) +2 other tests dmesg-fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#5390]) +17 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [PASS][115] -> [DMESG-FAIL][116] ([Intel XE#4543]) +8 other tests dmesg-fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#656]) +17 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#651]) +14 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#653]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2313]) +32 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#653]) +14 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2312]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#656]) +9 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][125] -> [SKIP][126] ([Intel XE#1503])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#1503])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2927])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4329])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#616]) +2 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#599])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2393])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4596])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#5020])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2763]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2763]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][137] -> [FAIL][138] ([Intel XE#718]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1406] / [Intel XE#2893])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1406] / [Intel XE#4608]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1406] / [Intel XE#4208]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1406] / [Intel XE#4609])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_psr@psr2-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#3414] / [Intel XE#3904])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2413]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1435])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#4208] / [i915#2575]) +29 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][156] -> [FAIL][157] ([Intel XE#4459]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#1499]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [FAIL][160] ([Intel XE#5794])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#4837]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4837]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#4837]) +15 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4518])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#4518])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#5793])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#688])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2322]) +11 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#1392]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1392]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][172] -> [SKIP][173] ([Intel XE#1392]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#288]) +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][177] -> [DMESG-WARN][178] ([Intel XE#3876])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#4915]) +113 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#4943]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#4915]) +66 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#4943]) +20 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2229])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208]) -> ([PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [SKIP][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234]) ([Intel XE#378])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256]) -> ([SKIP][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282]) ([Intel XE#2457])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307]) -> ([PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [SKIP][332], [PASS][333]) ([Intel XE#378])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][334] ([Intel XE#4208])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][335] ([Intel XE#3573]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][336] ([Intel XE#3573]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][337] ([Intel XE#1173])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#2284])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][339] ([Intel XE#584])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#4650])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#4733]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][342] ([Intel XE#4733]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][343] ([Intel XE#944])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#944])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][345] ([Intel XE#4130])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#4351])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-lnl:          NOTRUN -> [SKIP][347] ([Intel XE#4351])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2134]) -> [PASS][349] +1 other test pass
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@fbdev@unaligned-write.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][350] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][351] +4 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][352] ([Intel XE#4543]) -> [PASS][353] +21 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][354] ([Intel XE#3884]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][356] ([Intel XE#4543]) -> [PASS][357] +8 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][358] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][360] ([Intel XE#3862]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][362] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][364] ([Intel XE#2291]) -> [PASS][365] +2 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208] / [i915#2575]) -> [PASS][367] +95 other tests pass
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][368] ([Intel XE#3009]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_dp_aux_dev.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][370] ([Intel XE#2316]) -> [PASS][371] +2 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][372] ([Intel XE#301]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][375] +12 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][376] ([Intel XE#1503]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][378] ([Intel XE#718]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][380] ([Intel XE#1435]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#4208]) -> [PASS][383] +207 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1392]) -> [PASS][385] +2 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][386] -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][388] ([Intel XE#5786]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_pmu@engine-activity-idle:
    - shard-bmg:          [DMESG-WARN][390] ([Intel XE#5213]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_pmu@engine-activity-idle.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_pmu@engine-activity-idle.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - shard-bmg:          [FAIL][392] ([Intel XE#6006]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#316]) -> [SKIP][395] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#4208]) -> [SKIP][397] ([Intel XE#316])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#316]) -> [SKIP][399] ([Intel XE#4208]) +3 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][401] ([Intel XE#316])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][403] ([Intel XE#607])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#4208]) -> [SKIP][405] ([Intel XE#1124]) +6 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1124]) -> [SKIP][407] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][409] ([Intel XE#1124]) +5 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1124]) -> [SKIP][411] ([Intel XE#4208]) +6 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2191]) -> [SKIP][413] ([Intel XE#4208] / [i915#2575])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#4208] / [i915#2575]) -> [SKIP][415] ([Intel XE#2191])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#367]) -> [SKIP][417] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#4208] / [i915#2575]) -> [SKIP][419] ([Intel XE#367]) +4 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][421] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#4208]) -> [SKIP][423] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#4208]) -> [SKIP][425] ([Intel XE#2907]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][427] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#4208]) -> [SKIP][429] ([Intel XE#3442]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][430] ([Intel XE#3862]) -> [SKIP][431] ([Intel XE#4208])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][432] ([Intel XE#1727] / [Intel XE#3113]) -> [SKIP][433] ([Intel XE#2351] / [Intel XE#4208])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2907]) -> [SKIP][435] ([Intel XE#4208])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][437] ([Intel XE#4208]) +10 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#4418]) -> [SKIP][439] ([Intel XE#2351] / [Intel XE#4208])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#4208] / [i915#2575]) -> [SKIP][441] ([Intel XE#373]) +8 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#306]) -> [SKIP][443] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_chamelium_color@degamma.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#373]) -> [SKIP][445] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][446] ([Intel XE#1178]) -> [SKIP][447] ([Intel XE#4208] / [i915#2575])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#307]) -> [SKIP][449] ([Intel XE#4208] / [i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][450] ([Intel XE#2341]) -> [FAIL][451] ([Intel XE#1178])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#4208] / [i915#2575]) -> [FAIL][453] ([Intel XE#1188])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_content_protection@uevent.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#308]) -> [SKIP][455] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#323]) -> [SKIP][457] ([Intel XE#4208] / [i915#2575])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#4208] / [i915#2575]) -> [SKIP][459] ([Intel XE#323])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#4208]) -> [SKIP][461] ([Intel XE#4356]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#455]) -> [SKIP][463] ([Intel XE#4208]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#4422]) -> [SKIP][465] ([Intel XE#4208]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#4208] / [i915#2575]) -> [SKIP][467] ([Intel XE#703])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#4208] / [i915#2575]) -> [SKIP][469] ([Intel XE#1135]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-adlp:         [DMESG-WARN][470] ([Intel XE#4543]) -> [DMESG-FAIL][471] ([Intel XE#4543])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][472] ([Intel XE#4543]) -> [FAIL][473] ([Intel XE#301])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][474] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][475] ([Intel XE#4543])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][476] ([Intel XE#4543]) -> [DMESG-WARN][477] ([Intel XE#2953] / [Intel XE#4173])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#455]) -> [SKIP][479] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][481] ([Intel XE#455])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#4208]) -> [SKIP][483] ([Intel XE#455]) +4 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][484] ([Intel XE#2311]) -> [SKIP][485] ([Intel XE#2312]) +12 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][486] ([Intel XE#5390]) -> [SKIP][487] ([Intel XE#2312]) +5 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][488] ([Intel XE#2312]) -> [SKIP][489] ([Intel XE#5390]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#651]) -> [SKIP][491] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#4208]) -> [SKIP][493] ([Intel XE#651]) +20 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#651]) -> [SKIP][495] ([Intel XE#4208]) +15 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][496] ([Intel XE#2312]) -> [SKIP][497] ([Intel XE#2311]) +11 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][499] ([Intel XE#651]) +11 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][501] ([Intel XE#658]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][502] ([Intel XE#2312]) -> [SKIP][503] ([Intel XE#2313]) +9 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#653]) -> [SKIP][505] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][506] ([Intel XE#2313]) -> [SKIP][507] ([Intel XE#2312]) +6 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][509] ([Intel XE#653]) +9 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#4208]) -> [SKIP][511] ([Intel XE#653]) +25 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#653]) -> [SKIP][513] ([Intel XE#4208]) +15 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][514] ([Intel XE#3544]) -> [SKIP][515] ([Intel XE#3374] / [Intel XE#3544])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#4298]) -> [SKIP][517] ([Intel XE#4208])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#346]) -> [SKIP][519] ([Intel XE#4208])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2925]) -> [SKIP][521] ([Intel XE#4208])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#4208]) -> [SKIP][523] ([Intel XE#2925]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][524] ([Intel XE#5021]) -> [SKIP][525] ([Intel XE#4596])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#5020]) -> [SKIP][527] ([Intel XE#4208] / [i915#2575])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_plane_multiple@tiling-yf.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#2938]) -> [SKIP][529] ([Intel XE#4208])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#4208]) -> [SKIP][531] ([Intel XE#1129])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#908]) -> [SKIP][533] ([Intel XE#4208])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][535] ([Intel XE#1406] / [Intel XE#4208]) +7 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][537] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1122] / [Intel XE#1406]) -> [SKIP][539] ([Intel XE#1406] / [Intel XE#4208])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][541] ([Intel XE#1406] / [Intel XE#4208]) +5 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][543] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][545] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][547] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#1406] / [Intel XE#2939]) -> [SKIP][549] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#1406] / [Intel XE#2939]) -> [SKIP][551] ([Intel XE#1406] / [Intel XE#4208])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#4208] / [i915#2575]) -> [SKIP][553] ([Intel XE#3414])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1127]) -> [SKIP][555] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#3414]) -> [SKIP][557] ([Intel XE#4208] / [i915#2575])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#4208] / [i915#2575]) -> [SKIP][559] ([Intel XE#455]) +8 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][560] ([Intel XE#2426]) -> [FAIL][561] ([Intel XE#1729])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#4208] / [i915#2575]) -> [FAIL][563] ([Intel XE#1729])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1500]) -> [SKIP][565] ([Intel XE#4208] / [i915#2575])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#4208] / [i915#2575]) -> [SKIP][567] ([Intel XE#2168])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_vrr@cmrr.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#455]) -> [SKIP][569] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_vrr@flipline.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][571] ([Intel XE#4208])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     [FAIL][572] ([Intel XE#5890]) -> [SKIP][573] ([Intel XE#4208])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][574] -> [SKIP][575] ([Intel XE#4208])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_configfs@survivability-mode.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#4208]) -> [SKIP][577] ([Intel XE#1123]) +1 other test skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#1123]) -> [SKIP][579] ([Intel XE#4208])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#4208]) -> [SKIP][581] ([Intel XE#1126]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#1126]) -> [SKIP][583] ([Intel XE#4208]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#4208]) -> [SKIP][585] ([Intel XE#5626]) +2 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#4837]) -> [SKIP][587] ([Intel XE#4208]) +14 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#4208]) -> [SKIP][589] ([Intel XE#4837]) +12 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#4208]) -> [SKIP][591] ([Intel XE#1392])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#1392]) -> [SKIP][593] ([Intel XE#4208]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#4208]) -> [SKIP][595] ([Intel XE#288]) +24 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#288]) -> [SKIP][597] ([Intel XE#4208]) +20 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#4915]) -> [SKIP][599] ([Intel XE#4208]) +253 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#4208]) -> [SKIP][601] ([Intel XE#4915]) +292 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][602] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][603] ([Intel XE#5530])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][604] ([Intel XE#5893]) -> [SKIP][605] ([Intel XE#4208])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#255]) -> [SKIP][607] ([Intel XE#4208])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#4208]) -> [SKIP][609] ([Intel XE#512])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_mmap@small-bar.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#5103]) -> [SKIP][611] ([Intel XE#4208])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#4208]) -> [SKIP][613] ([Intel XE#3573]) +8 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#3573]) -> [SKIP][615] ([Intel XE#4208]) +9 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1337]) -> [SKIP][617] ([Intel XE#4208])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][619] ([Intel XE#4208])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#4208]) -> [SKIP][621] ([Intel XE#979])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][623] ([Intel XE#1173])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_peer2peer@read.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#1061] / [Intel XE#4208]) -> [SKIP][625] ([Intel XE#1061])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_peer2peer@write.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#4208]) -> [SKIP][627] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#579]) -> [SKIP][629] ([Intel XE#4208])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#4208]) -> [SKIP][631] ([Intel XE#4650])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#4733]) -> [SKIP][633] ([Intel XE#4208]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#4208]) -> [SKIP][635] ([Intel XE#4733]) +2 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#4208]) -> [SKIP][637] ([Intel XE#944]) +4 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#944]) -> [SKIP][639] ([Intel XE#4208]) +4 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#4814]) -> [SKIP][641] ([Intel XE#4208])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#4208]) -> [SKIP][643] ([Intel XE#4814])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#4821]) -> [SKIP][645] ([Intel XE#4208])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_spin_batch@spin-mem-copy.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#4130]) -> [SKIP][647] ([Intel XE#4208]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#4208]) -> [SKIP][649] ([Intel XE#4130]) +1 other test skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#3342]) -> [SKIP][651] ([Intel XE#4208])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     [SKIP][652] ([Intel XE#4208]) -> [SKIP][653] ([Intel XE#4273])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#4208]) -> [SKIP][655] ([Intel XE#4351])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5941
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6006
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8512 -> IGT_8514
  * Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -> xe-pw-153535v4

  IGT_8512: 8512
  IGT_8514: 8514
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97
  xe-pw-153535v4: 153535v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/index.html

--===============6298413792105536532==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.49.4 for BMG, LNL, =
PTL, PVC (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153535/">https://patchwork.freedesktop.org/series/153535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153535v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb248=
96baa97_FULL -&gt; xe-pw-153535v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153535v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-153535v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1535=
35v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-=
1:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> +3 other tests fail<=
/li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_oa@buffer-size=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@xe_oa@m=
mio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@xe_=
oa@mmio-triggered-reports-read.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153535v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_at=
omic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_atomic@=
plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +77 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adl=
p-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_ccs@bad-aux-stride-yf-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5376">Intel XE#5376</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5941">Intel XE#5941</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg=
2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_chamelium_color@ctm-blu=
e-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_chamelium_frames@vga-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_cursor_crc@cursor-slidi=
ng-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-rec=
reate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-9/igt@kms_fli=
p@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@kms_flip@fli=
p-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_flip@flip-vs-suspend-inte=
rruptible@c-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +15 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sha=
rd-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +179 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +121 other tests skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 ot=
her tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@km=
s_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_hdr@static-swap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 o=
ther test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#46=
08</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-rend=
er@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@kms_psr@psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_psr@psr2-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_vblank@accuracy-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_compute@ccs-mode-basic.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5794">Intel XE#5794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_eudebug@basic-vm-access-us=
erptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-3/igt@xe_eudebug@vm-bind-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_evict@evict-small-multi-vm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>) +11 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-1/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-malloc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +113 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-8/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-new-bo-map-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
+66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +20 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/sha=
rd-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896b=
aa97/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24=
896baa97/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20c=
fb24896baa97/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2=
a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e=
8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce=
3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e=
19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7=
fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59c=
f1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-=
a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-153535v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896b=
aa97/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24=
896baa97/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20c=
fb24896baa97/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2=
a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e=
8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce=
3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e=
19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7=
fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59c=
f1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-=
a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard=
-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb2489=
6baa97/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20c=
fb24896baa97/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8=
cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19c=
e3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7f=
e0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59=
cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-36=
31-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896b=
aa97/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb=
24896baa97/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2=
a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a=
6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e=
19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1=
d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-=
a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153535v4/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-153535v4/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153535v4/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/=
shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153535v4/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/igt@xe_oa@buffer-fill.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">=
Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_pmu@fn-engine-activity-s=
ched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@xe_pxp@display-black-pxp-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-5/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153535v4/shard-lnl-2/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@fbdev@=
unaligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@fbdev@unalign=
ed-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-c-hdmi-a-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153535v4/shard-adlp-9/igt@kms_async_flips@async-flip-with-p=
age-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PASS</a> +21 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-=
8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@kms_big=
_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-2/=
igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a> +8 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153535v4/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-b=
mg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153535v4/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-tran=
sitions.html">PASS</a> +95 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-1/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-upscaling.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-2/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153535v4/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bm=
g-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exe=
c_basic@many-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_e=
xec_basic@many-null-rebind.html">PASS</a> +207 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-4=
66/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontunmap-eochec=
k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_exec_=
system_allocator@many-execqueues-mmap-remap-dontunmap-eocheck.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4=
/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-dontun=
map-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sh=
ard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_pmu@e=
ngine-activity-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-8/igt@xe_pm=
u@engine-activity-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf=
-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/600=
6">Intel XE#6006</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153535v4/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-=
reprovision-increase-numvfs@vf-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms=
_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bi=
g_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@k=
ms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@km=
s_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard=
-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3535v4/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153535v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153535v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-43=
4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535=
v4/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/=
igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shar=
d-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153535v4/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2=
-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/=
shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153535v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535=
v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-=
432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_chame=
lium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_chameli=
um_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@=
kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-5/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2=
-436/igt@kms_content_protection@uevent.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel=
 XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153535v4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-436/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_dp=
_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@kms_d=
p_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/=
shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-43=
2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adlp-4/i=
gt@kms_flip@flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
adlp-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adl=
p-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-adl=
p-9/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153535v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153535v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-3=
2bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153535v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb10=
1010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
535v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53535v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
535v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v=
4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3535v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535=
v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt=
@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-d=
g2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sha=
rd-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Int=
el XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153535v4/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153535v4/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_ps=
r@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#92=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
535v4/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ps=
r@fbc-pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1535=
35v4/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ps=
r@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shar=
d-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535=
v4/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel=
 XE#2939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153535v4/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel=
 XE#2939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153535v4/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard=
-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_sc=
aling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sha=
rd-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/sh=
ard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/s=
hard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@kms_vrr@flipline.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt-many-all-ram.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard=
-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_configfs@surviv=
ability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-=
dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel =
XE#4837</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/=
igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg=
2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg=
2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#28=
8</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535=
v4/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-no=
memset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_exe=
c_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
15">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_exec_system_allocator@process-ma=
ny-large-execqueues-new-bo-map-nomemset.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +253 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153535v4/shard-dg2-433/igt@xe_exec_system_allocator@threads-sha=
red-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +292 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Int=
el XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153535v4/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct=
_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#=
5893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153535v4/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_se=
nd_recv.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@xe_mmap@small-bar=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_oa@=
mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@x=
e_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-433/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg=
2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-463/igt@xe_=
peer2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-432/igt@xe=
_peer2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/igt@xe_p=
m@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-435/=
igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe=
_query@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434=
/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/=
igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_ren=
der_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-464/=
igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2=
-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153535v4/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-434/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sri=
ov_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg2-466/igt@xe_sr=
iov_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v4/shard-dg=
2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4=
351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8512 -&gt; IGT_8514</li>
<li>Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -&gt; xe-pw-153=
535v4</li>
</ul>
<p>IGT_8512: 8512<br />
  IGT_8514: 8514<br />
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf=
2a20cfb24896baa97<br />
  xe-pw-153535v4: 153535v4</p>

</body>
</html>

--===============6298413792105536532==--
