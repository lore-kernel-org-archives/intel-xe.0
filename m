Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F400DD10375
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 03:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B3610E01F;
	Thu, 27 Nov 2025 03:18:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1CE10E01F;
 Thu, 27 Nov 2025 03:18:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2920222252516936498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_SRIOV_scheduler_?=
 =?utf-8?q?groups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 03:18:13 -0000
Message-ID: <176421349329.30433.14973984677593608995@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

--===============2920222252516936498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce SRIOV scheduler groups
URL   : https://patchwork.freedesktop.org/series/158142/
State : failure

== Summary ==

CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL -> xe-pw-158142v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158142v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158142v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158142v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) -> ([ABORT][26], [ABORT][27], [ABORT][28], [ABORT][29], [ABORT][30], [ABORT][31], [ABORT][32], [ABORT][33], [ABORT][34], [ABORT][35], [ABORT][36], [ABORT][37], [ABORT][38], [ABORT][39], [ABORT][40], [ABORT][41], [ABORT][42], [ABORT][43], [ABORT][44], [ABORT][45], [ABORT][46], [ABORT][47])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71]) -> ([ABORT][72], [ABORT][73], [ABORT][74], [ABORT][75], [ABORT][76], [ABORT][77], [ABORT][78], [ABORT][79], [ABORT][80], [ABORT][81], [ABORT][82], [ABORT][83], [ABORT][84], [ABORT][85], [ABORT][86], [ABORT][87], [ABORT][88], [ABORT][89], [ABORT][90], [ABORT][91], [ABORT][92], [ABORT][93], [ABORT][94])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-463/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_FULL and xe-pw-158142v1_FULL:

### New IGT tests (1) ###

  * igt@xe_gpgpu_fill@offset-16x16:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-158142v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1124])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2724])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2252])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#2291])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2316])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2311])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2313]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][104] -> [ABORT][105] ([Intel XE#6662]) +1 other test abort
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-bmg:          [PASS][106] -> [ABORT][107] ([Intel XE#6675]) +1 other test abort
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          NOTRUN -> [ABORT][109] ([Intel XE#6675]) +3 other tests abort
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][110] -> [WARN][111] ([Intel XE#5786])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-free-madvise:
    - shard-bmg:          [PASS][112] -> [ABORT][113] ([Intel XE#3970])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_system_allocator@process-many-free-madvise.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-free-madvise.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#6251]) +2 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Possible fixes ####

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-bmg:          [FAIL][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][118] ([Intel XE#2291]) -> [PASS][119] +3 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][120] ([Intel XE#5299]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][122] ([Intel XE#2316]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][124] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-bmg:          [ABORT][126] ([Intel XE#6675]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [INCOMPLETE][128] ([Intel XE#4488]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-bmg:          [ABORT][130] ([Intel XE#3970]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-5/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][132] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][133] ([Intel XE#301])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][134] ([Intel XE#2312]) -> [SKIP][135] ([Intel XE#2311]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][136] ([Intel XE#2312]) -> [SKIP][137] ([Intel XE#4141])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][138] ([Intel XE#4141]) -> [SKIP][139] ([Intel XE#2312])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][140] ([Intel XE#2311]) -> [SKIP][141] ([Intel XE#2312]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#2313]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][144] ([Intel XE#2313]) -> [SKIP][145] ([Intel XE#2312]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][146] ([Intel XE#2509]) -> [SKIP][147] ([Intel XE#2426])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6662]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6662
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675


Build changes
-------------

  * Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -> xe-pw-158142v1

  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884
  xe-pw-158142v1: 158142v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/index.html

--===============2920222252516936498==
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
<tr><td><b>Series:</b></td><td>Introduce SRIOV scheduler groups</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158142/">https://patchwork.freedesktop.org/series/158142/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158142v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158142v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b=
06fe884_FULL -&gt; xe-pw-158142v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158142v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-158142v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1581=
42v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe88=
4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b0=
6fe884/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68c=
ba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c=
2a68cba8b06fe884/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8a=
ee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3=
a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430=
515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a7=
67430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156=
-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe88=
4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b0=
6fe884/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68c=
ba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c=
2a68cba8b06fe884/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8a=
ee91c2a68cba8b06fe884/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/=
shard-adlp-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_l=
oad@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158142v1/shard-adlp-6/igt@xe_module_load@load.html">ABORT</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adl=
p-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158142v1/shard-adlp-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@x=
e_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158142v1/shard-adlp-2/igt@xe_module_load@load.html">ABO=
RT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1=
/shard-adlp-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_=
load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-158142v1/shard-adlp-3/igt@xe_module_load@load.html">ABORT</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-ad=
lp-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-1/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158142v1/shard-adlp-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@=
xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-adlp-4/igt@xe_module_load@load.html">AB=
ORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v=
1/shard-adlp-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module=
_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158142v1/shard-adlp-8/igt@xe_module_load@load.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-a=
dlp-8/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-adlp-9/igt@xe_module_load@loa=
d.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-158142v1/shard-adlp-9/igt@xe_module_load@load.html">ABORT</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard=
-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b0=
6fe884/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68=
cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee=
91c2a68cba8b06fe884/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a=
6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430=
515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a=
767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-41=
56-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06f=
e884/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cb=
a8b06fe884/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c=
2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8=
aee91c2a68cba8b06fe884/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515=
c3a6e8aee91c2a68cba8b06fe884/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767=
430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-=
e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-dg2-434/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-d=
g2-432/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-432/igt@xe_module_load@l=
oad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-158142v1/shard-dg2-432/igt@xe_module_load@load.html">ABORT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436=
/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-436/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58142v1/shard-dg2-433/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@x=
e_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158142v1/shard-dg2-433/igt@xe_module_load@load.html">AB=
ORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v=
1/shard-dg2-464/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_modu=
le_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158142v1/shard-dg2-464/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shar=
d-dg2-434/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-434/igt@xe_module_loa=
d@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-158142v1/shard-dg2-434/igt@xe_module_load@load.html">ABORT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-=
435/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-435/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158142v1/shard-dg2-435/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/=
igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-466/igt@xe_module_load@load.htm=
l">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
8142v1/shard-dg2-466/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-158142v1/shard-dg2-463/igt@xe_module_load@load.html">ABO=
RT</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4156-e7a767430515c3a6e8aee91c2=
a68cba8b06fe884_FULL and xe-pw-158142v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_gpgpu_fill@offset-16x16:<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158142v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-en=
able-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-=
bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158142v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_hdr@=
bpc-switch-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6662">Intel XE#6662</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-2/igt@k=
ms_plane@plane-panning-bottom-right-suspend@pipe-b.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675=
</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158142v1/shard-bmg-1/igt@kms_vblank@ts-continuation-su=
spend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6675">Intel XE#6675</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-8/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-free-madvise.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-3/igt@xe=
_exec_system_allocator@process-many-free-madvise.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-1/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-lnl-2/igt@xe_pmu@engine-acti=
vity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_curs=
or_edge_walk@256x256-left-edge.html">FAIL</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/igt@kms_cursor_edg=
e_walk@256x256-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg-4/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-bmg=
-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158142v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-e=
dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-a.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/sh=
ard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-4/igt@kms_vbla=
nk@ts-continuation-dpms-suspend@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1581=
42v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-5/igt@xe_exec_=
system_allocator@processes-evict-malloc.html">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/shard-=
bmg-1/igt@xe_exec_system_allocator@processes-evict-malloc.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1581=
42v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-158142v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1581=
42v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1581=
42v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel X=
E#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58142v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158142v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v1/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -&gt; xe-pw-158=
142v1</li>
</ul>
<p>IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91=
c2a68cba8b06fe884<br />
  xe-pw-158142v1: 158142v1</p>

</body>
</html>

--===============2920222252516936498==--
