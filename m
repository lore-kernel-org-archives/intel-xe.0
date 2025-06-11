Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F42C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 04:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A34610E13D;
	Wed, 11 Jun 2025 04:00:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50C710E13D;
 Wed, 11 Jun 2025 04:00:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1082215750859300116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Crashlog_Type1_Version2_su?=
 =?utf-8?q?pport_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 04:00:12 -0000
Message-ID: <174961441294.66319.1295164344644368303@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

--===============1082215750859300116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crashlog Type1 Version2 support (rev4)
URL   : https://patchwork.freedesktop.org/series/149120/
State : failure

== Summary ==

CI Bug Log - changes from xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60_FULL -> xe-pw-149120v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149120v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149120v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149120v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) -> ([DMESG-FAIL][26], [DMESG-FAIL][27], [DMESG-FAIL][28], [DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-8/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-3/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-8/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-8/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-1/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-6/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-3/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-6/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-6/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-4/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-4/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-4/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-8/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-1/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-1/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-1/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-7/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-7/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-7/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-2/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-6/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-6/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-6/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-5/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-5/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74]) -> ([DMESG-FAIL][75], [DMESG-FAIL][76], [DMESG-FAIL][77], [DMESG-FAIL][78], [DMESG-FAIL][79], [DMESG-FAIL][80], [DMESG-FAIL][81], [DMESG-FAIL][82], [DMESG-FAIL][83], [DMESG-FAIL][84], [DMESG-FAIL][85], [DMESG-FAIL][86], [DMESG-FAIL][87], [DMESG-FAIL][88], [DMESG-FAIL][89], [DMESG-FAIL][90], [DMESG-FAIL][91], [DMESG-FAIL][92], [DMESG-FAIL][93], [DMESG-FAIL][94], [DMESG-FAIL][95], [DMESG-FAIL][96], [DMESG-FAIL][97], [DMESG-FAIL][98], [DMESG-FAIL][99])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [SKIP][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125]) ([Intel XE#378]) -> ([DMESG-FAIL][126], [DMESG-FAIL][127], [DMESG-FAIL][128], [DMESG-FAIL][129], [DMESG-FAIL][130], [DMESG-FAIL][131], [DMESG-FAIL][132], [DMESG-FAIL][133], [DMESG-FAIL][134], [DMESG-FAIL][135], [DMESG-FAIL][136], [DMESG-FAIL][137], [DMESG-FAIL][138], [DMESG-FAIL][139], [DMESG-FAIL][140], [DMESG-FAIL][141], [DMESG-FAIL][142], [DMESG-FAIL][143], [DMESG-FAIL][144], [DMESG-FAIL][145], [DMESG-FAIL][146], [DMESG-FAIL][147], [DMESG-FAIL][148], [DMESG-FAIL][149], [DMESG-FAIL][150])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-1/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-1/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-1/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-6/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-6/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-6/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [SKIP][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176]) ([Intel XE#378]) -> ([DMESG-FAIL][177], [DMESG-FAIL][178], [DMESG-FAIL][179], [DMESG-FAIL][180], [DMESG-FAIL][181], [DMESG-FAIL][182], [DMESG-FAIL][183], [DMESG-FAIL][184], [DMESG-FAIL][185], [DMESG-FAIL][186], [DMESG-FAIL][187], [DMESG-FAIL][188], [DMESG-FAIL][189], [DMESG-FAIL][190], [DMESG-FAIL][191], [DMESG-FAIL][192], [DMESG-FAIL][193], [DMESG-FAIL][194], [DMESG-FAIL][195], [DMESG-FAIL][196], [DMESG-FAIL][197], [DMESG-FAIL][198], [DMESG-FAIL][199], [DMESG-FAIL][200], [DMESG-FAIL][201])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-8/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-4/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.html

  
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * IGT: IGT_8403 -> IGT_8404
  * Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -> xe-pw-149120v4

  IGT_8403: f2e82612b44bf8c30bfd0c523b69e424dc5f8d7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60
  xe-pw-149120v4: 149120v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/index.html

--===============1082215750859300116==
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
<tr><td><b>Series:</b></td><td>Crashlog Type1 Version2 support (rev4)</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149120/">https://patchwork.freedesktop.org/series/149120/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149120v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149120v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3226-7bc153635620254b73cfe8714ce42768b=
2bf6d60_FULL -&gt; xe-pw-149120v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149120v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149120v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1491=
20v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf=
6d60/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768=
b2bf6d60/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce4=
2768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe871=
4ce42768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cf=
e8714ce42768b2bf6d60/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b=
73cfe8714ce42768b2bf6d60/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620=
254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc15363=
5620254b73cfe8714ce42768b2bf6d60/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc1=
53635620254b73cfe8714ce42768b2bf6d60/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-=
7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-4/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149120v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v=
4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-8/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149120v4/shard-bmg-8/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1491=
20v4/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-1/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149120v4/shard-bmg-1/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49120v4/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-7/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-7/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149120v4/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-2=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-2/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149120v4/shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bm=
g-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-6/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149120v4/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard=
-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149120v4/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/sh=
ard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-bmg-5/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149120v4/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4=
/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2=
bf6d60/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce4=
2768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe=
8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254=
b73cfe8714ce42768b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635=
620254b73cfe8714ce42768b2bf6d60/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc=
153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-32=
26-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf=
6d60/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce427=
68b2bf6d60/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe871=
4ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73=
cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620=
254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153=
635620254b73cfe8714ce42768b2bf6d60/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-=
7bc153635620254b73cfe8714ce42768b2bf6d60/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/sh=
ard-dg2-434/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149120v4/shard-dg2-434/igt@xe_module_load@load.html">DM=
ESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9120v4/shard-dg2-434/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/=
igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@loa=
d.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149120v4/shard-dg2-464/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard=
-dg2-464/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-464/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html">DMESG=
-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14912=
0v4/shard-dg2-436/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@=
xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149120v4/shard-dg2-436/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2=
-463/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/=
shard-dg2-463/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-463/igt@xe_m=
odule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149120v4/shard-dg2-435/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149120v4/shard-dg2-435/igt@xe_module_load@load.html">DMESG-FAIL</a=
>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf=
6d60/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768=
b2bf6d60/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce4=
2768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe871=
4ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cf=
e8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b=
73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620=
254b73cfe8714ce42768b2bf6d60/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc15363=
5620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc1=
53635620254b73cfe8714ce42768b2bf6d60/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-=
7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d6=
0/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl=
-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149120v4/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-=
lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/sha=
rd-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-8/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/=
shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_modul=
e_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149120v4/shard-lnl-4/igt@xe_module_load@load.html">DMESG-=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120=
v4/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-6/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v4/shard-lnl-6/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
120v4/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-3/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149120v4/shard-lnl-3/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149120v4/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-2/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-2/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149120v4/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>)</=
li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d6=
0/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2=
bf6d60/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42=
768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe871=
4ce42768b2bf6d60/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73c=
fe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc15363562025=
4b73cfe8714ce42768b2bf6d60/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635=
620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc1=
53635620254b73cfe8714ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226=
-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/shard-ad=
lp-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d6=
0/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42768b2=
bf6d60/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe8714ce42=
768b2bf6d60/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73cfe871=
4ce42768b2bf6d60/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc153635620254b73c=
fe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3226-7bc15363562025=
4b73cfe8714ce42768b2bf6d60/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149120v4/shard-adlp-6/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-=
adlp-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-6/igt@xe_module_lo=
ad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/=
shard-adlp-9/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149120v4/shard-adlp-9/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
120v4/shard-adlp-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-8/igt@=
xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-8/igt@xe_module_load@load.htm=
l">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-=
2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149120v4/shard-adlp-2/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard=
-adlp-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149120v4/shard-adlp-3/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4=
/shard-adlp-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-4/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v4/shard-adlp-4/igt@xe_module_load@load.html">DM=
ESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9120v4/shard-adlp-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/i=
gt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.=
html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149120v4/shard-adlp-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v4/shard-ad=
lp-1/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8403 -&gt; IGT_8404</li>
<li>Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -&gt; xe-pw-149=
120v4</li>
</ul>
<p>IGT_8403: f2e82612b44bf8c30bfd0c523b69e424dc5f8d7a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe87=
14ce42768b2bf6d60<br />
  xe-pw-149120v4: 149120v4</p>

</body>
</html>

--===============1082215750859300116==--
