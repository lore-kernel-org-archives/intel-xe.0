Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF09CCF2564
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 01:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A398A10E54C;
	Wed, 19 Nov 2025 01:50:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24110E54C;
 Wed, 19 Nov 2025 01:50:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4562649218963668597=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E54=2E0_for_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 01:50:58 -0000
Message-ID: <176351705836.6922.179045092632227545@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118235218.1788466-2-julia.filipchuk@intel.com>
In-Reply-To: <20251118235218.1788466-2-julia.filipchuk@intel.com>
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

--===============4562649218963668597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.54.0 for BMG, PTL
URL   : https://patchwork.freedesktop.org/series/157751/
State : failure

== Summary ==

CI Bug Log - changes from xe-4124-b603326a067916accf680fd623f4fc3c22bba487_FULL -> xe-pw-157751v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157751v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157751v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157751v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27]) -> ([DMESG-FAIL][28], [DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50], [DMESG-FAIL][51], [DMESG-FAIL][52])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-3/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-6/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-6/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-3/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-1/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-1/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-7/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-7/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-2/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-4/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-4/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-4/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-157751v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#6054])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#316])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1407])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#316]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1428])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][59] -> [DMESG-FAIL][60] ([Intel XE#4543]) +12 other tests dmesg-fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1124]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1124]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1124]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2191])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#367])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#367]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#787]) +90 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#787]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][70] -> [INCOMPLETE][71] ([Intel XE#3862]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2887]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#306])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#373]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#373]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#373]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1424]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][79] ([Intel XE#2953] / [Intel XE#4173])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#309]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#309]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#323])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4422])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1137])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1135])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1135])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1421]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#310]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][89] -> [DMESG-WARN][90] ([Intel XE#4543] / [Intel XE#5208])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#4543]) +19 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-9/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-8/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][96] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#455]) +15 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][99] -> [DMESG-FAIL][100] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#651]) +21 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][102] ([Intel XE#4543])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#656]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#651]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#651])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#656]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#6312])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#653]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#653]) +20 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#455])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2925] / [Intel XE#3012])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2925])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-adlp:         [PASS][114] -> [DMESG-WARN][115] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#5624])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4359])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#5020])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#870])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406] / [Intel XE#2893])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1406])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][126] -> [SKIP][127] ([Intel XE#1406] / [Intel XE#4692])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#330])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#4227]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-2/igt@kms_vrr@flipline.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2168]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1123])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#5626])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#4837] / [Intel XE#5565]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4837]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4837]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#688]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_evict@evict-beng-threads-small.html
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#261])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#688])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1392]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#288]) +21 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4915]) +239 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#4915]) +70 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#4943]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) -> ([PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [SKIP][198]) ([Intel XE#378])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#6032])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_oa@buffer-size.html
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#6032])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#3573]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#3573])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@xe_oa@non-zero-reason.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [PASS][203] -> [DMESG-WARN][204] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#584])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [PASS][207] -> [FAIL][208] ([Intel XE#6251])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#4733]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][210] ([Intel XE#944]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#4130]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#4130])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][213] ([Intel XE#3908]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][215] ([Intel XE#4543]) -> [PASS][216] +3 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-adlp:         [DMESG-WARN][217] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][218] +8 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@kms_color@ctm-blue-to-red.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-8/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#4543]) -> [PASS][220] +3 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][221] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][223] ([Intel XE#2049]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][225] ([Intel XE#718]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [ABORT][227] ([Intel XE#5545]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms.html

  * {igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12}:
    - shard-lnl:          [DMESG-WARN][229] ([Intel XE#4537]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html

  * igt@xe_exec_balancer@once-cm-parallel-basic:
    - shard-adlp:         [FAIL][231] ([Intel XE#5625]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_balancer@once-cm-parallel-basic.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-basic.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-adlp:         [DMESG-FAIL][233] ([Intel XE#3876]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][235] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#6362]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_pm_residency@idle-residency.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_pm_residency@idle-residency.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][239] ([Intel XE#6251]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [DMESG-FAIL][241] ([Intel XE#3868] / [Intel XE#5213]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][243] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][244] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) +1 other test incomplete
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#2594]) -> [SKIP][246] ([Intel XE#288])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][247] ([Intel XE#3868]) -> [DMESG-WARN][248] ([Intel XE#3868])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8631 -> IGT_8632
  * Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -> xe-pw-157751v1

  IGT_8631: 8631
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487
  xe-pw-157751v1: 157751v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/index.html

--===============4562649218963668597==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.54.0 for BMG, PTL</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157751/">https://patchwork.freedesktop.org/series/157751/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157751v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157751v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4124-b603326a067916accf680fd623f4fc3c2=
2bba487_FULL -&gt; xe-pw-157751v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157751v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157751v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1577=
51v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_ro=
tation_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@km=
s_rotation_crc@primary-4-tiled-reflect-x-180.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bb=
a487/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c=
22bba487/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4=
fc3c22bba487/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd6=
23f4fc3c22bba487/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf68=
0fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916ac=
cf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a0679=
16accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a=
067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603=
326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-=
b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-3/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-157751v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v=
1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157751v1/shard-bmg-6/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1577=
51v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-1/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-157751v1/shard-bmg-1/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57751v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-8=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-7/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-157751v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bm=
g-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-2/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-157751v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard=
-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-4/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-157751v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/sh=
ard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-157751v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1=
/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157751v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
7751v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-a=
dlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-ti=
led-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_chamelium_edid@hdmi-mode-=
timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_cursor_crc@cursor-slidin=
g-64x21.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs=
-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-2/igt@kms_flip@2x-nonexisting-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-che=
ck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-9/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-8/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +19=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#=
4921</a>) +1 other test dmesg-fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-157751v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_joiner@basic-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2925">Intel XE#2925</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@kms_pip=
e_crc_basic@disable-crc-after-crtc.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_pipe_=
crc_basic@disable-crc-after-crtc.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb=
8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 oth=
er tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@kms_psr@fbc-pr-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692"=
>Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-2/igt@kms_vrr@=
flipline.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157751v1/shard-lnl-7/igt@kms_vrr@flipline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_eudebug@basic-exec-queues=
-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_evict@evict-beng-threads-s=
mall.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@xe_evict@evict-beng-threads-=
small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_evict@evict-small-cm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-ex=
ec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +2 other tests skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_exec_fault_mode@once-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-share=
d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-many-execqueues-mmap-prefetch-shared.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +23=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-3/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915=
">Intel XE#4915</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22=
bba487/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4=
fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680=
fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916a=
ccf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a0=
67916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b60=
3326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-41=
24-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bb=
a487/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc=
3c22bba487/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd6=
23f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf=
680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a0679=
16accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b60332=
6a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-=
b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-157751v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57751v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-157751v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157751v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/=
shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2=
-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157751v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-463/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1=
/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-433/igt@xe_oa@buffer-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032"=
>Intel XE#6032</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/igt@xe_oa@buffer-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032">=
Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_oa@mmio-triggered-report=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-adlp-4/igt@xe_oa@non-zero-reason.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@xe_pm@s=
2idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_pm@s2idle-mocs.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"=
>Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-3/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-7/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/s=
hard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_clas=
s_copy0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-466/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@=
exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157751v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/=
shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-157751v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@kms_col=
or@ctm-blue-to-red.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-ad=
lp-8/igt@kms_color@ctm-blue-to-red.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_fli=
p@flip-vs-modeset-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard=
-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html">PASS</a> +3 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157=
751v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/sh=
ard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157751v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_pm_=
rpm@universal-planes-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-9/igt@kms=
_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_shar=
pness_filter@filter-formats@pipe-a-edp-1-nv12.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1577=
51v1/shard-lnl-3/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec=
_balancer@once-cm-parallel-basic.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-6/i=
gt@xe_exec_balancer@once-cm-parallel-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec=
_threads@threads-bal-mixed-fd-userptr.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/sha=
rd-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE=
#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157751v1/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_pm_=
residency@idle-residency.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6362">Intel XE#6362</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-434/igt@xe_p=
m_residency@idle-residency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/625=
1">Intel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-157751v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@eng=
ine-drm_xe_engine_class_video_decode0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel X=
E#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5213">Intel XE#5213</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-en=
gine-resets@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-dg2-435/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/270=
5">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-prefetch.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard=
-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#28=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec=
_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/shard-adlp-2/igt@xe_e=
xec_reset@cm-cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8631 -&gt; IGT_8632</li>
<li>Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -&gt; xe-pw-157=
751v1</li>
</ul>
<p>IGT_8631: 8631<br />
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd=
623f4fc3c22bba487<br />
  xe-pw-157751v1: 157751v1</p>

</body>
</html>

--===============4562649218963668597==--
