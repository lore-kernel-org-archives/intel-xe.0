Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F9E7719C
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 22:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2410EF4A;
	Thu,  9 Jan 2025 22:08:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A535F10EF4A;
 Thu,  9 Jan 2025 22:08:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6783817124454855989=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Expose_modifiers/formats_s?=
 =?utf-8?q?upported_by_async_flips_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 22:08:18 -0000
Message-ID: <173646049867.1742394.10314629237814666944@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
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

--===============6783817124454855989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose modifiers/formats supported by async flips (rev2)
URL   : https://patchwork.freedesktop.org/series/140934/
State : failure

== Summary ==

CI Bug Log - changes from xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5_full -> xe-pw-140934v2_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-140934v2_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140934v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140934v2_full:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [SKIP][24], [PASS][25], [PASS][26]) ([Intel XE#378]) -> ([ABORT][27], [ABORT][28], [ABORT][29], [ABORT][30], [ABORT][31], [ABORT][32], [ABORT][33], [ABORT][34], [ABORT][35], [ABORT][36], [ABORT][37], [ABORT][38], [ABORT][39], [ABORT][40], [ABORT][41], [ABORT][42], [ABORT][43], [ABORT][44], [ABORT][45], [ABORT][46], [ABORT][47], [ABORT][48], [ABORT][49], [ABORT][50])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-3/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [SKIP][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76]) ([Intel XE#378]) -> ([ABORT][77], [ABORT][78], [ABORT][79], [ABORT][80], [ABORT][81], [ABORT][82], [ABORT][83], [ABORT][84], [ABORT][85], [ABORT][86], [ABORT][87], [ABORT][88], [ABORT][89], [ABORT][90], [ABORT][91], [ABORT][92], [ABORT][93], [ABORT][94], [ABORT][95], [ABORT][96], [ABORT][97], [ABORT][98], [ABORT][99], [ABORT][100])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-9/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-8/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-8/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-9/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-8/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-9/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-3/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-8/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-1/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-4/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-2/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126]) ([Intel XE#378]) -> ([DMESG-WARN][127], [ABORT][128], [ABORT][129], [ABORT][130], [ABORT][131], [DMESG-WARN][132], [DMESG-WARN][133], [DMESG-WARN][134], [DMESG-WARN][135], [DMESG-WARN][136], [DMESG-WARN][137], [DMESG-WARN][138], [DMESG-WARN][139], [DMESG-WARN][140], [ABORT][141], [ABORT][142], [ABORT][143], [ABORT][144], [ABORT][145], [ABORT][146], [ABORT][147], [ABORT][148], [ABORT][149], [ABORT][150])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html

  
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * Linux: xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 -> xe-pw-140934v2

  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5
  xe-pw-140934v2: 140934v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/index.html

--===============6783817124454855989==
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
<tr><td><b>Series:</b></td><td>Expose modifiers/formats supported by async =
flips (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/140934/">https://patchwork.freedesktop.org/series/140934/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-140934v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-140934v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0f=
f3acad5_full -&gt; xe-pw-140934v2_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-140934v2_full need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-140934v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1409=
34v2_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3a=
cad5/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0=
ff3acad5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67c=
c9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44=
a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973=
fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9f=
f973fa44a67cc9a0ff3acad5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0=
ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27=
d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14=
ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-=
8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-=
lnl-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad=
5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl=
-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
40934v2/shard-lnl-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_mo=
dule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shar=
d-lnl-8/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/igt@xe_module_load@lo=
ad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-140934v2/shard-lnl-8/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-8/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934=
v2/shard-lnl-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_=
load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.html">ABORT</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl=
-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-4/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
40934v2/shard-lnl-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_mo=
dule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shar=
d-lnl-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@lo=
ad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-140934v2/shard-lnl-5/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-140934v2/shard-lnl-6/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934=
v2/shard-lnl-6/igt@xe_module_load@load.html">ABORT</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad=
5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff=
3acad5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc=
9a0ff3acad5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44=
a67cc9a0ff3acad5/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff97=
3fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff=
9ff973fa44a67cc9a0ff3acad5/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d=
7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14=
ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452=
-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad=
5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff=
3acad5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc=
9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44=
a67cc9a0ff3acad5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff97=
3fa44a67cc9a0ff3acad5/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff=
9ff973fa44a67cc9a0ff3acad5/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-=
6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-6/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
40934v2/shard-adlp-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_=
module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_load@load.html">ABORT=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/s=
hard-adlp-9/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-9/igt@xe_module_lo=
ad@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-140934v2/shard-adlp-8/igt@xe_module_load@load.html">ABORT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp=
-8/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-8/igt@xe_module_load@load.h=
tml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
140934v2/shard-adlp-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-1/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-140934v2/shard-adlp-1/igt@xe_module_load@load.html">ABOR=
T</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/=
shard-adlp-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-4/igt@xe_module_l=
oad@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-140934v2/shard-adlp-4/igt@xe_module_load@load.html">ABORT</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adl=
p-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@xe_module_load@load.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-140934v2/shard-adlp-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-3/igt@x=
e_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-140934v2/shard-adlp-2/igt@xe_module_load@load.html">ABO=
RT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2=
/shard-adlp-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-adlp-2/igt@xe_module_=
load@load.html">ABORT</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-4=
35/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff=
3acad5/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67c=
c9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973f=
a44a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9=
ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d=
7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f1=
4ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
52-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-d=
g2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3a=
cad5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9=
a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44=
a67cc9a0ff3acad5/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff9=
73fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0=
ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac=
27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-=
8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-434/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html">ABORT</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard=
-dg2-435/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load=
@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-140934v2/shard-dg2-435/igt@xe_module_load@load.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-4=
66/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/sh=
ard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
0934v2/shard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-466/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load.html">ABORT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-=
434/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-140934v2/shard-dg2-434/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-434/=
igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.htm=
l">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
0934v2/shard-dg2-436/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-140934v2/shard-dg2-436/igt@xe_module_load@load.html">ABO=
RT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2=
/shard-dg2-436/igt@xe_module_load@load.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 -&gt; xe-pw-140=
934v2</li>
</ul>
<p>IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa4=
4a67cc9a0ff3acad5<br />
  xe-pw-140934v2: 140934v2</p>

</body>
</html>

--===============6783817124454855989==--
