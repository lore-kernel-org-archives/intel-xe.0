Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA5C83F34
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 05:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9D610E1CA;
	Sat, 19 Jul 2025 05:57:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F7010E1CA;
 Sat, 19 Jul 2025 05:57:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3608163463549370539=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_Precompute_pla?=
 =?utf-8?q?ne_SURF_address/etc=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Jul 2025 05:57:34 -0000
Message-ID: <175290465434.174665.8721944776547092213@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717171353.23090-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250717171353.23090-1-ville.syrjala@linux.intel.com>
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

--===============3608163463549370539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Precompute plane SURF address/etc. (rev3)
URL   : https://patchwork.freedesktop.org/series/147096/
State : failure

== Summary ==

CI Bug Log - changes from xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee_FULL -> xe-pw-147096v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147096v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147096v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147096v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +25 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_evict@evict-large-external-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@xe_evict@evict-large-external-cm.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [SKIP][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30]) ([Intel XE#378]) -> ([DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53], [DMESG-WARN][54], [DMESG-WARN][55])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-7/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-6/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-6/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-8/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-1/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-8/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-8/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-1/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-6/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-6/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-6/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-8/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-8/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-2/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-3/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-3/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-1/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-5/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][56], [PASS][57], [PASS][58], [SKIP][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80]) ([Intel XE#2457]) -> ([DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [PASS][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97], [DMESG-WARN][98], [PASS][99], [DMESG-WARN][100], [DMESG-WARN][101], [DMESG-WARN][102], [DMESG-WARN][103], [DMESG-WARN][104], [DMESG-WARN][105])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-3/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-1/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-3/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-5/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-147096v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-adlp:         [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2953] / [Intel XE#4173])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-6/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][108] -> [DMESG-FAIL][109] ([Intel XE#4543])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#2291])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#2316]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
    - shard-adlp:         [PASS][114] -> [DMESG-WARN][115] ([Intel XE#4543]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-WARN][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#4543]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][120] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][121] +7 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][122] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#569]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-6/igt@xe_pm@s3-vm-bind-userptr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-3/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][124] ([Intel XE#2311]) -> [SKIP][125] ([Intel XE#2312]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][126] ([Intel XE#2313]) -> [SKIP][127] ([Intel XE#2312]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [SKIP][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153]) ([Intel XE#378]) -> ([DMESG-WARN][154], [DMESG-WARN][155], [DMESG-WARN][156], [DMESG-WARN][157], [DMESG-WARN][158], [DMESG-WARN][159], [DMESG-WARN][160], [DMESG-WARN][161], [DMESG-WARN][162], [DMESG-WARN][163], [DMESG-WARN][164], [DMESG-WARN][165], [DMESG-WARN][166], [DMESG-WARN][167], [DMESG-WARN][168], [DMESG-WARN][169], [DMESG-WARN][170], [DMESG-WARN][171], [DMESG-WARN][172], [DMESG-WARN][173], [DMESG-WARN][174], [DMESG-WARN][175], [DMESG-WARN][176], [DMESG-WARN][177], [DMESG-WARN][178]) ([Intel XE#4543])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-436/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-436/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-436/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-433/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-433/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-433/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-464/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-464/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-434/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-434/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-463/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-463/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-463/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-466/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-466/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-435/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-435/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-435/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-434/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-434/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-433/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-433/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-433/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-436/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-436/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-436/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-463/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-463/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-463/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-432/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-432/igt@xe_module_load@load.html

  
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569


Build changes
-------------

  * Linux: xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee -> xe-pw-147096v3

  IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee: b1223560f49403d45494aad75bd3633ab63ab4ee
  xe-pw-147096v3: 147096v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/index.html

--===============3608163463549370539==
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
<tr><td><b>Series:</b></td><td>drm/i915: Precompute plane SURF address/etc.=
 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147096/">https://patchwork.freedesktop.org/series/147096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147096v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147096v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3432-b1223560f49403d45494aad75bd3633ab=
63ab4ee_FULL -&gt; xe-pw-147096v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147096v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147096v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1470=
96v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-3/igt@kms_fbc=
on_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147096v3/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend=
.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@xe_evict=
@evict-large-external-cm.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@xe_evict@evict-large=
-external-cm.html">DMESG-WARN</a> +25 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63a=
b4ee/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633a=
b63ab4ee/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3=
633ab63ab4ee/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad7=
5bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494=
aad75bd3633ab63ab4ee/shard-lnl-3/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d4=
5494aad75bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f494=
03d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560=
f49403d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b122=
3560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-=
b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4e=
e/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl=
-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-6/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147096v3/shard-lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-=
lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-4/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147096v3/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/sha=
rd-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-8/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147096v3/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/=
shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-2/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147096v3/shard-lnl-2/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096=
v3/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-3/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147096v3/shard-lnl-3/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
096v3/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-1/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147096v3/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147096v3/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147096v3/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-5=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-lnl-5/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147096v3/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63a=
b4ee/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633a=
b63ab4ee/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3=
633ab63ab4ee/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad7=
5bd3633ab63ab4ee/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494=
aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d4=
5494aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f494=
03d45494aad75bd3633ab63ab4ee/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560=
f49403d45494aad75bd3633ab63ab4ee/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b122=
3560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-=
b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-8=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-8/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147096v3/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bm=
g-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-1/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147096v3/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard=
-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-7/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147096v3/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/sh=
ard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147096v3/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3=
/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/sh=
ard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147096v3/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-3/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147096v3/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/sh=
ard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-5/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147096v3/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3=
/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147096v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-4/igt@kms_ato=
mic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-6/=
igt@kms_atomic_transition@plane-all-transition-nonblocking.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">=
Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/sha=
rd-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-bmg-6/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-dpms@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-adlp-6/igt@kms_flip@basi=
c-flip-vs-dpms@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test d=
mesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/s=
hard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-fli=
p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147096v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1470=
96v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-adlp-6/igt@xe_pm@s=
3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096=
v3/shard-adlp-3/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7096v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1470=
96v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard=
-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee=
/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab6=
3ab4ee/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3=
633ab63ab4ee/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494a=
ad75bd3633ab63ab4ee/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d=
45494aad75bd3633ab63ab4ee/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f=
49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b12=
23560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-34=
32-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63a=
b4ee/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad75bd363=
3ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d45494aad7=
5bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f49403d454=
94aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b1223560f494=
03d45494aad75bd3633ab63ab4ee/shard-dg2-466/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-b12235=
60f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3432-=
b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-466/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147096v3/shard-dg2-466/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/=
shard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-435/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-147096v3/shard-dg2-435/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147096v3/shard-dg2-435/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-434=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-434/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147096v3/shard-dg2-434/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shar=
d-dg2-464/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147096v3/shard-dg2-464/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1470=
96v3/shard-dg2-464/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-433/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-433/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-147096v3/shard-dg2-433/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg=
2-436/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-436/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147096v3/shard-dg2-436/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3=
/shard-dg2-463/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-463/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147096v3/shard-dg2-463/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147096v3/shard-dg2-432/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-43=
2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147096v3/shard-dg2-432/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee -&gt; xe-pw-147=
096v3</li>
</ul>
<p>IGT_8465: dce322d513ea2c1793520e98658ffd28e94874fb @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3432-b1223560f49403d45494aad75bd3633ab63ab4ee: b1223560f49403d45494aad=
75bd3633ab63ab4ee<br />
  xe-pw-147096v3: 147096v3</p>

</body>
</html>

--===============3608163463549370539==--
