Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7931C0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 21:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267C10EA31;
	Fri, 24 Jan 2025 21:50:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2AF10EA31;
 Fri, 24 Jan 2025 21:50:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0403546294382386834=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_VRR_timing_generator_f?=
 =?utf-8?q?or_fixed_refresh_rate_modes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 21:50:52 -0000
Message-ID: <173775545294.29183.460551819440918755@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
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

--===============0403546294382386834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use VRR timing generator for fixed refresh rate modes (rev2)
URL   : https://patchwork.freedesktop.org/series/141152/
State : failure

== Summary ==

CI Bug Log - changes from xe-2548-897537fb818365733977947214c799d61675895f_full -> xe-pw-141152v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141152v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141152v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141152v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27]) -> ([DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-8/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-8/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-5/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-5/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-7/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-7/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-2/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-2/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-2/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-3/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-3/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-dg2-set2:     NOTRUN -> [ABORT][53]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][54] ([Intel XE#2925]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [SKIP][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81]) ([Intel XE#378]) -> ([DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [DMESG-WARN][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97], [DMESG-WARN][98], [DMESG-WARN][99], [DMESG-WARN][100], [DMESG-WARN][101], [DMESG-WARN][102], [DMESG-WARN][103], [DMESG-WARN][104], [DMESG-WARN][105], [DMESG-WARN][106])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-2/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-7/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-6/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-6/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-2/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-7/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-3/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-6/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-3/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-3/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-8/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-4/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-4/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-6/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-5/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-5/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-2/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1130]) -> [ABORT][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html

  
Known issues
------------

  Here are the changes found in xe-pw-141152v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#3249])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2134]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@fbdev@nullptr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][113] -> [DMESG-WARN][114] ([Intel XE#1033]) +14 other tests dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@fbdev@read.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#3767]) +15 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#619])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#316]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][120] ([Intel XE#1033])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1124]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#610])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2191]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2191]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#367]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#367]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#787]) +17 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#3442])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][130] ([Intel XE#3862])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#787]) +153 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#306])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#373]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#373]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1178]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#455]) +15 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#308]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#308]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#309]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [PASS][141] -> [DMESG-FAIL][142] ([Intel XE#1033])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#701])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1138])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#310]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2423] / [i915#2575]) +33 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][147] -> [INCOMPLETE][148] ([Intel XE#2049]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#301]) +9 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][150] -> [FAIL][151] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][152] -> [FAIL][153] ([Intel XE#301])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#2136]) +22 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2136]) +33 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][157] -> [DMESG-FAIL][158] ([Intel XE#1033]) +4 other tests dmesg-fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#656]) +24 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#651]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#651]) +16 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#653]) +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#653]) +13 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-handle-zero:
    - shard-dg2-set2:     [PASS][165] -> [SKIP][166] ([Intel XE#2423] / [i915#2575]) +87 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_getfb@getfb-handle-zero.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2763]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#2763]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#2763] / [Intel XE#455])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#734])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#2007])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][173] -> [SKIP][174] ([Intel XE#2446]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#2446]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#1489]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1489]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#2939])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2939])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#3414]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#2168])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2168])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#455]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#455] / [Intel XE#488])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#3576])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#1126])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#2905]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#2905]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#261] / [Intel XE#688])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#688])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#1392]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#1392]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#288]) +10 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#288]) +12 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][197] -> [SKIP][198] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [PASS][199] -> [SKIP][200] ([Intel XE#2229])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][201] ([Intel XE#1999]) +2 other tests fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#512])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#378])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][204] -> [FAIL][205] ([Intel XE#3546])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_module_load@many-reload.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_module_load@many-reload.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][206] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_oa@missing-sample-flags.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][208] ([Intel XE#1173])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#2284] / [Intel XE#366])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][210] ([Intel XE#1033]) +19 other tests dmesg-warn
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][211] -> [DMESG-WARN][212] ([Intel XE#1033] / [Intel XE#569])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [ABORT][213] ([Intel XE#1358] / [Intel XE#1607])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_pm@s4-basic.html
    - shard-dg2-set2:     [PASS][214] -> [ABORT][215] ([Intel XE#1358])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_pm@s4-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2284] / [Intel XE#366])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [PASS][217] -> [ABORT][218] ([Intel XE#1358] / [Intel XE#1794])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#944]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#1130]) +52 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_query@query-uc-fw-version-huc.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][221] -> [SKIP][222] ([Intel XE#1130]) +150 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2423]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_getstats.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@core_getstats.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#3249]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#3453]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][229] ([Intel XE#1033]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2423] / [i915#2575]) -> [PASS][232] +65 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [FAIL][233] ([Intel XE#1874]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][235] ([Intel XE#1033]) -> [PASS][236] +7 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#3862]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][239] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][242] +7 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136]) -> [PASS][244] +18 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][245] ([Intel XE#718]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2446]) -> [PASS][248] +2 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][249] ([Intel XE#771] / [Intel XE#899]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][251] ([Intel XE#899]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][253] ([Intel XE#1033] / [Intel XE#1473]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_evict@evict-large-multi-vm.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1392]) -> [PASS][256] +2 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_threads@threads-bal-userptr:
    - shard-dg2-set2:     [DMESG-WARN][257] ([Intel XE#1033]) -> [PASS][258] +13 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_exec_threads@threads-bal-userptr.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [DMESG-WARN][259] -> [PASS][260] +5 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][261] ([Intel XE#3546]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_module_load@reload.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [DMESG-WARN][263] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_pm@s3-basic.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][265] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1130]) -> [PASS][268] +133 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#3768])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][272] ([Intel XE#1033]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][274] ([Intel XE#316])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#316]) -> [SKIP][276] ([Intel XE#2136])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136]) -> [SKIP][278] ([Intel XE#610]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][280] ([Intel XE#1124]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1124]) -> [SKIP][282] ([Intel XE#2136]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#1124]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#607]) -> [SKIP][286] ([Intel XE#2136])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1124]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2191]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#367]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#367]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][296] ([Intel XE#2136]) +15 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][298] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#3442]) -> [SKIP][300] ([Intel XE#2136])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#3862]) -> [DMESG-WARN][302] ([Intel XE#1033])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2907]) -> [SKIP][304] ([Intel XE#2136])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][307] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#306])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#306]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#373]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#373]) +7 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#307]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#455]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_content_protection@lic-type-1.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#308])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#323]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][327] ([Intel XE#1033]) -> [SKIP][328] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#323]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1135]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [FAIL][334] ([Intel XE#301]) +1 other test fail
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][335] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2136]) -> [DMESG-WARN][338] ([Intel XE#1033])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#455]) -> [SKIP][340] ([Intel XE#2136] / [Intel XE#2351])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#455]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#455]) -> [SKIP][344] ([Intel XE#2136]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][346] ([Intel XE#455]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#651]) -> [SKIP][348] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2136]) -> [SKIP][350] ([Intel XE#651]) +19 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#651]) -> [SKIP][352] ([Intel XE#2136]) +17 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [DMESG-WARN][353] ([Intel XE#1033]) -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2351])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][356] ([Intel XE#651]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][358] ([Intel XE#653]) +3 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#653]) -> [SKIP][360] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#653]) -> [SKIP][362] ([Intel XE#2136]) +19 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#653]) +19 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#346]) -> [SKIP][366] ([Intel XE#2136])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2925]) -> [SKIP][368] ([Intel XE#2136])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#455]) -> [SKIP][370] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][371] -> [DMESG-WARN][372] ([Intel XE#1033])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2423] / [i915#2575]) -> [SKIP][374] ([Intel XE#2763] / [Intel XE#455])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#870]) -> [SKIP][376] ([Intel XE#2136])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2136]) -> [SKIP][378] ([Intel XE#2938])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2136]) -> [SKIP][380] ([Intel XE#3309])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#908]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1129]) -> [SKIP][384] ([Intel XE#2136] / [Intel XE#2351])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [DMESG-WARN][385] ([Intel XE#1033]) -> [SKIP][386] ([Intel XE#2446])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136]) -> [SKIP][388] ([Intel XE#1489]) +7 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1489]) -> [SKIP][390] ([Intel XE#2136]) +6 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1122]) -> [SKIP][392] ([Intel XE#2136]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136]) -> [SKIP][394] ([Intel XE#1122])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136]) -> [SKIP][398] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][400] ([Intel XE#2136]) +10 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][404] ([Intel XE#2351]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#3414]) -> [SKIP][406] ([Intel XE#2423] / [i915#2575])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2423] / [i915#2575]) -> [SKIP][408] ([Intel XE#1127])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1127]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2423] / [i915#2575]) -> [SKIP][412] ([Intel XE#3414])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [DMESG-WARN][413] -> [SKIP][414] ([Intel XE#2423] / [i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2423] / [i915#2575]) -> [FAIL][416] ([Intel XE#1729])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#330]) -> [SKIP][418] ([Intel XE#2423] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy-hang:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][420] ([Intel XE#1033]) +5 other tests dmesg-warn
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_vblank@query-busy-hang.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_vblank@query-busy-hang.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#756]) -> [SKIP][422] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][424] ([Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][426] ([Intel XE#1130]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#3889]) -> [SKIP][428] ([Intel XE#1130])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2905]) -> [SKIP][430] ([Intel XE#1130]) +9 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1130]) -> [DMESG-WARN][432] ([Intel XE#1033]) +1 other test dmesg-warn
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1392]) -> [SKIP][434] ([Intel XE#1130])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1130]) -> [SKIP][436] ([Intel XE#1392])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#288]) -> [SKIP][438] ([Intel XE#1130]) +28 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1130]) -> [SKIP][440] ([Intel XE#288]) +20 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2360]) -> [SKIP][442] ([Intel XE#1130])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1130]) -> [SKIP][444] ([Intel XE#2360])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1130]) -> [SKIP][446] ([Intel XE#2905]) +10 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][448] ([Intel XE#1130]) +6 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1130]) -> [SKIP][450] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_oa@polling-small-buf.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1061]) -> [FAIL][452] ([Intel XE#1173])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_peer2peer@write.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1130]) -> [SKIP][454] ([Intel XE#2284] / [Intel XE#366])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][456] ([Intel XE#1130]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][457] ([Intel XE#1358] / [Intel XE#1794]) -> [DMESG-WARN][458] ([Intel XE#1033] / [Intel XE#569])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][459] ([Intel XE#1033] / [Intel XE#569]) -> [ABORT][460] ([Intel XE#1033] / [Intel XE#1358])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@xe_pm@s3-exec-after.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [SKIP][462] ([Intel XE#944]) +2 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#944]) -> [SKIP][464] ([Intel XE#1130]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#4130]) -> [SKIP][466] ([Intel XE#1130])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1130]) -> [SKIP][468] ([Intel XE#4130])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8207 -> IGT_8208
  * Linux: xe-2548-897537fb818365733977947214c799d61675895f -> xe-pw-141152v2

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8208: 24c50086b0441a44e3eab291d0c34e716565041b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2548-897537fb818365733977947214c799d61675895f: 897537fb818365733977947214c799d61675895f
  xe-pw-141152v2: 141152v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/index.html

--===============0403546294382386834==
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
<tr><td><b>Series:</b></td><td>Use VRR timing generator for fixed refresh r=
ate modes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141152/">https://patchwork.freedesktop.org/series/141152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141152v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141152v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2548-897537fb818365733977947214c799d61=
675895f_full -&gt; xe-pw-141152v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141152v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-141152v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1411=
52v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@p=
ipe-d.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675=
895f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d6=
1675895f/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c7=
99d61675895f/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb8183657339779472=
14c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977=
947214c799d61675895f/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb81836573=
3977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb8183=
65733977947214c799d61675895f/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb=
818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-8975=
37fb818365733977947214c799d61675895f/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-=
897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
548-897537fb818365733977947214c799d61675895f/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-2/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-141152v2/shard-bmg-2/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v=
2/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141152v2/shard-bmg-4/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1411=
52v2/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-3/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141152v2/shard-bmg-3/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41152v2/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-4/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-5=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bm=
g-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-8/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141152v2/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-1/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141152v2/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2=
/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm_residency@gt-c6-freez=
e@gt0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sha=
rd-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675=
895f/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d6=
1675895f/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c7=
99d61675895f/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb8183657339779472=
14c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977=
947214c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb81836573=
3977947214c799d61675895f/shard-lnl-1/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb8183=
65733977947214c799d61675895f/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb=
818365733977947214c799d61675895f/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-8975=
37fb818365733977947214c799d61675895f/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-=
897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895=
f/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl=
-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-3/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-141152v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-8/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141152v2/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sha=
rd-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-141152v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/=
shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141152v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152=
v2/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-1/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-lnl-6/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
152v2/shard-lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-6/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141152v2/shard-lnl-5/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141152v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-5/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-2/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-7=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-lnl-7/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141152v2/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_pm_=
residency@gt-c6-freeze.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm_=
residency@gt-c6-freeze.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141152v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@core_s=
etmaster@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@core_setmaste=
r@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@fbdev@=
nullptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141152v2/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#21=
34</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@fbdev@=
read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141152v2/shard-dg2-436/igt@fbdev@read.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_big_fb@4-=
tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_bw@linear-tiling-4-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_content_protection@atom=
ic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_fb=
con_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspe=
nd.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_flip@2x-blocking-wf_vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_flip@absolute-wf_vblank=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-d=
g2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +9 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sha=
rd-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-ad=
lp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_ge=
tfb@getfb-handle-zero.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_getfb@getfb-handl=
e-zero.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007=
">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm=
_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_rpm@basic-pc=
i-d3-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp=
-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_psr@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-3/igt@xe_ccs@block-multicopy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@xe_evict@evict-beng-small-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_exec_fault_mode@many-exec=
queues-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_liv=
e_ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"=
>Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_liv=
e_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_live_=
ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_liv=
e_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_mod=
ule_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_module_load@many-re=
load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_oa@invalid-map-oa-buffer.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_oa@missing-sample-flags.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_pm@d3hot-multiple-execs.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@xe_pm@=
s3-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1607">Intel XE#1607</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_pm@=
s4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE=
#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_pm@=
s4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@xe_pm@s4-multiple-execs.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-adlp-2/igt@xe_query@multigpu-query-inva=
lid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_query@query-uc-fw-versio=
n-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_vm@=
mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_vm@m=
map-style-bind-userptr-one-partial.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +150 other =
tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_g=
etstats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@core_getstats.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_s=
etmaster@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt=
@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@core_s=
etmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-43=
3/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-141152v2/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-b=
-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141152v2/shard-dg2-463/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v=
2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">In=
tel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141152v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-r=
c-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-4/igt@kms_flip_sca=
led_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-move.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1152v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb=
-draw-blt.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-9/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141152v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm=
_rpm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_pm_=
rpm@universal-planes.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_uni=
versal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-adl=
p-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-2/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_evi=
ct@evict-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sha=
rd-dg2-432/igt@xe_evict@evict-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_exe=
c_threads@threads-bal-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-4=
63/igt@xe_exec_threads@threads-bal-userptr.html">PASS</a> +13 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14115=
2v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile=
_init_early.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_mod=
ule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_module_loa=
d@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_pm@=
s3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe=
_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1411=
52v2/shard-adlp-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_vm@=
large-split-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@x=
e_vm@large-split-binds-536870912.html">PASS</a> +133 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1411=
52v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">=
Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bi=
g_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shar=
d-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shar=
d-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@k=
ms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141152v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141152v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@=
kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg=
2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v=
2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-46=
6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1411=
52v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152=
v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2=
-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/=
shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141152v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4010">Intel XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-=
436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_chamel=
ium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard=
-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/=
shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1152v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transiti=
ons.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1152v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg=
2-466/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64b=
pp-linear-downscaling.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141152v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141152v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-=
64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141152v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152=
v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
152v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14115=
2v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141152v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141152v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shar=
d-dg2-434/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_=
panel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_pl=
ane_scaling@intel-max-src-size.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_pl=
ane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms=
_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_pm=
_rpm@cursor-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_pm=
_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141152v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@kms_ps=
r2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sha=
rd-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shar=
d-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@kms_psr@fbc-p=
sr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-=
466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_rot=
ation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
152v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/=
igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@kms_vb=
lank@query-busy-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-46=
3/igt@kms_vblank@query-busy-hang.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@kms_wr=
iteback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-433/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/sh=
ard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_com=
pute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
152v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-436/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-=
dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exe=
c_balancer@many-execqueues-cm-parallel-userptr-invalidate.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel X=
E#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141152v2/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-parallel-u=
serptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141152v2/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41152v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr=
-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_exe=
c_fault_mode@once-basic-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/igt@xe_=
exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/=
igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-435/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-d=
g2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE=
#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433=
/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +=
10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v=
2/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-436/igt@xe_oa@polli=
ng-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-433/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-463/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466/=
igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-432/igt@xe_pm@=
s3-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-43=
4/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@xe_pm@=
s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-432/=
igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_que=
ry@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-434/igt@x=
e_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-434/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-466=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-463/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2=
-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2548-897537fb818365733977947214c799d61675895f/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/shard-dg2-=
436/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8207 -&gt; IGT_8208</li>
<li>Linux: xe-2548-897537fb818365733977947214c799d61675895f -&gt; xe-pw-141=
152v2</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8208: 24c50086b0441a44e3eab291d0c34e716565041b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2548-897537fb818365733977947214c799d61675895f: 897537fb818365733977947=
214c799d61675895f<br />
  xe-pw-141152v2: 141152v2</p>

</body>
</html>

--===============0403546294382386834==--
