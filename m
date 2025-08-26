Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48863CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9110E6BA;
	Tue, 26 Aug 2025 17:13:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71BB10E6AF;
 Tue, 26 Aug 2025 17:13:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2210522314570377549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_kunit=3A_Refactor_and_exte?=
 =?utf-8?q?nd_KUnit=27s_parameterized_testing_framework_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marie Zhussupova" <marievic@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 17:13:02 -0000
Message-ID: <175622838290.271012.5830324690573388104@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826091341.1427123-1-davidgow@google.com>
In-Reply-To: <20250826091341.1427123-1-davidgow@google.com>
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

--===============2210522314570377549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kunit: Refactor and extend KUnit's parameterized testing framework (rev3)
URL   : https://patchwork.freedesktop.org/series/152794/
State : failure

== Summary ==

CI Bug Log - changes from xe-3618-d6164c0a2d38489ed21f76946137a58772594504_FULL -> xe-pw-152794v3_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-152794v3_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152794v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152794v3_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [SKIP][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378]) -> ([PASS][27], [PASS][28], [ABORT][29], [ABORT][30], [ABORT][31], [ABORT][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [SKIP][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52]) ([Intel XE#378])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-5/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-5/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-4/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-5/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-8/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-8/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-8/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-4/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-4/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-2/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-5/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-5/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-3/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-5/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-1/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-3/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [SKIP][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [ABORT][89], [ABORT][90], [ABORT][91], [SKIP][92], [ABORT][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103]) ([Intel XE#378] / [Intel XE#5612])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-4/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-4/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-4/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-1/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-3/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-8/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-8/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-152794v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#316])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2327]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1124]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1124])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#2314] / [Intel XE#2894])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#367])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#787]) +48 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2887]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#3432])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2252]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#373])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][120] ([Intel XE#1178])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#455])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2320])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#2291]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][125] -> [SKIP][126] ([Intel XE#2316]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#4543]) +3 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][129] ([Intel XE#2049] / [Intel XE#2597])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2293] / [Intel XE#2380])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2293])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2311]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#651]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#5390]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2313]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#653]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#4208] / [i915#2575]) +59 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_lease@invalid-create-leases.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#616])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#4596])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1406] / [Intel XE#1489])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1406] / [Intel XE#1489])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_psr@fbc-pr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#3414] / [Intel XE#3904])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][148] -> [SKIP][149] ([Intel XE#1435])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4837]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2322])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
    - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#1392])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     [PASS][154] -> [INCOMPLETE][155] ([Intel XE#4842])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4943]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4915]) +19 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][158] -> [DMESG-WARN][159] ([Intel XE#5893])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2229])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][161] -> [FAIL][162] ([Intel XE#4208]) +1 other test fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_module_load@reload.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_oa@enable-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#3573])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_oa@enable-disable.html

  * igt@xe_pat@prime-self-import-coh:
    - shard-dg2-set2:     [PASS][164] -> [SKIP][165] ([Intel XE#4208]) +132 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_pat@prime-self-import-coh.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pat@prime-self-import-coh.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#4733])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#4273])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][169] ([Intel XE#911]) -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#4208]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][175] ([Intel XE#5376]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#4208] / [i915#2575]) -> [PASS][178] +5 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][179] ([Intel XE#2291]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][181] ([Intel XE#4633]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][183] ([Intel XE#1475]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][185] ([Intel XE#5299]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][187] ([Intel XE#4302]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][189] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][191] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][193] ([Intel XE#2316]) -> [PASS][194] +7 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#4543]) -> [PASS][196] +7 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [ABORT][197] ([Intel XE#4760] / [Intel XE#5545]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1392]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#3876]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [FAIL][203] -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [DMESG-WARN][205] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][206] +2 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#623]) -> [SKIP][208] ([Intel XE#4208] / [i915#2575])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#316]) -> [SKIP][210] ([Intel XE#4208]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1124]) -> [SKIP][212] ([Intel XE#4208]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][214] ([Intel XE#1124])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4208]) -> [SKIP][216] ([Intel XE#1124])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1124]) -> [SKIP][218] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2191]) -> [SKIP][220] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#367]) -> [SKIP][222] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2907]) -> [SKIP][224] ([Intel XE#4208]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#4208]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][227] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][228] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#306]) -> [SKIP][230] ([Intel XE#4208] / [i915#2575])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#373]) -> [SKIP][232] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][233] ([Intel XE#2341]) -> [FAIL][234] ([Intel XE#1178])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_content_protection@atomic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#307]) -> [SKIP][236] ([Intel XE#4208] / [i915#2575])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4208] / [i915#2575]) -> [SKIP][238] ([Intel XE#455])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#1178]) -> [SKIP][240] ([Intel XE#4208] / [i915#2575])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_content_protection@srm.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4354]) -> [SKIP][242] ([Intel XE#4208])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#455]) -> [SKIP][244] ([Intel XE#4208]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#776]) -> [SKIP][246] ([Intel XE#4208]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][248] ([Intel XE#2049] / [Intel XE#2597])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#455]) -> [SKIP][250] ([Intel XE#2351] / [Intel XE#4208])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][251] ([Intel XE#2312]) -> [SKIP][252] ([Intel XE#2311]) +12 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][253] ([Intel XE#2311]) -> [SKIP][254] ([Intel XE#2312]) +10 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][255] ([Intel XE#2312]) -> [SKIP][256] ([Intel XE#5390]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][257] ([Intel XE#5390]) -> [SKIP][258] ([Intel XE#2312]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#651]) -> [SKIP][260] ([Intel XE#4208]) +10 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#651]) -> [SKIP][262] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#658]) -> [SKIP][264] ([Intel XE#2351] / [Intel XE#4208])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#2313]) -> [SKIP][266] ([Intel XE#2312]) +11 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#653]) -> [SKIP][268] ([Intel XE#4208]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#653]) -> [SKIP][270] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2313]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#4298]) -> [SKIP][274] ([Intel XE#4208])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2925]) -> [SKIP][276] ([Intel XE#4208])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#616]) -> [SKIP][278] ([Intel XE#4208] / [i915#2575])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_plane_cursor@primary.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#5020]) -> [SKIP][280] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_plane_multiple@tiling-yf.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1129]) -> [SKIP][282] ([Intel XE#2351] / [Intel XE#4208])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][284] ([Intel XE#1406] / [Intel XE#1489])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][286] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][288] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_psr@pr-dpms.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][290] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_psr@psr2-basic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][292] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_psr@psr2-dpms.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_psr@psr2-dpms.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][293] ([Intel XE#2426]) -> [SKIP][294] ([Intel XE#2509])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#455]) -> [SKIP][296] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][298] ([Intel XE#4208])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1126]) -> [SKIP][300] ([Intel XE#4208]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#5626]) -> [SKIP][302] ([Intel XE#4208])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4837]) -> [SKIP][304] ([Intel XE#4208]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208]) -> [SKIP][306] ([Intel XE#4837])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1392]) -> [SKIP][308] ([Intel XE#4208]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#288])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#288]) -> [SKIP][312] ([Intel XE#4208]) +18 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2360]) -> [SKIP][314] ([Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4915]) -> [SKIP][316] ([Intel XE#4208]) +182 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#4915]) +18 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_exec_system_allocator@twice-mmap-shared-remap.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@xe_exec_system_allocator@twice-mmap-shared-remap.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][319] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][320] ([Intel XE#5466])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#3573]) -> [SKIP][322] ([Intel XE#4208]) +4 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_oa@invalid-remove-userspace-config.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][324] ([Intel XE#4208]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_pm@d3cold-basic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#5694]) -> [SKIP][326] ([Intel XE#4208])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_pm@d3cold-i2c.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#579]) -> [SKIP][328] ([Intel XE#4208])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#4733]) -> [SKIP][330] ([Intel XE#4208]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#944]) -> [SKIP][332] ([Intel XE#4208]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4814]) -> [SKIP][334] ([Intel XE#4208])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4821]) -> [SKIP][336] ([Intel XE#4208])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3618-d6164c0a2d38489ed21f76946137a58772594504 -> xe-pw-152794v3

  IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3618-d6164c0a2d38489ed21f76946137a58772594504: d6164c0a2d38489ed21f76946137a58772594504
  xe-pw-152794v3: 152794v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/index.html

--===============2210522314570377549==
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
<tr><td><b>Series:</b></td><td>kunit: Refactor and extend KUnit&#x27;s para=
meterized testing framework (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152794/">https://patchwork.freedesktop.org/series/152794/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152794v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152794v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3618-d6164c0a2d38489ed21f76946137a5877=
2594504_FULL -&gt; xe-pw-152794v3_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-152794v3_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152794v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1527=
94v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/sha=
rd-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a5877259=
4504/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a587=
72594504/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137=
a58772594504/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f7694=
6137a58772594504/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f=
76946137a58772594504/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489e=
d21f76946137a58772594504/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38=
489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a=
2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d616=
4c0a2d38489ed21f76946137a58772594504/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-=
d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-1/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a5877259450=
4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
794v3/shard-lnl-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_modu=
le_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152794v3/shard-lnl-2/igt@xe_module_load@load.html">ABORT</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-=
lnl-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152794v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-8/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152794v3/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152794v3/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a5877259450=
4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772=
594504/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a=
58772594504/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f7694=
6137a58772594504/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21=
f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d3848=
9ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2=
d38489ed21f76946137a58772594504/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d616=
4c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618=
-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/sha=
rd-adlp-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a5877259450=
4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a58772=
594504/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f76946137a=
58772594504/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21f7694=
6137a58772594504/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d38489ed21=
f76946137a58772594504/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3618-d6164c0a2d3848=
9ed21f76946137a58772594504/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v=
3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152794v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2794v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152794v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/igt@xe_module_load@lo=
ad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152794v3/shard-adlp-9/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-9/i=
gt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15279=
4v3/shard-adlp-9/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/sh=
ard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152794v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612">=
Intel XE#5612</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152794v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_cc=
s@bad-pixel-format-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_c=
cs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_cursor_crc@cursor-slidi=
ng-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-6/igt@kms_fli=
p@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-1/igt@kms_f=
lip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-in=
terruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests ski=
p</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_le=
ase@invalid-create-leases.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_lease@invalid=
-create-leases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +59 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@kms_psr@fbc-pr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_eudebug_online@interrupt-o=
ther.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-userptr.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-466/igt@xe_exec_ba=
sic@multigpu-no-exec-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_exec_system_allocator@once=
-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-malloc-multi-fault.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-4=
66/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_oa@enable-disable.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_pat=
@prime-self-import-coh.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pat@prime-self-im=
port-coh.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-bmg-7/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152794v3/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152794v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@km=
s_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-b=
mg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1527=
94v3/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">PAS=
S</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-b=
mg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/sha=
rd-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#=
2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152794v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2=
597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52794v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-5/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-2/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-adlp-6/i=
gt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_pm_r=
pm@dpms-non-lpsp.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/ig=
t@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152794v3/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@x=
e_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@xe_exec_=
threads@threads-cm-shared-vm-userptr-rebind.html">FAIL</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-6/igt@x=
e_exec_threads@threads-cm-shared-vm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-adlp-8/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/s=
hard-adlp-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-=
434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152794v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152794v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152794v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-43=
4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shar=
d-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152794v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152794v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@k=
ms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_ch=
amelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-4=
34/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-bmg-2/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@=
kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard=
-dg2-433/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_fbcon_f=
bt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/=
shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152794v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
794v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152794v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1527=
94v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3=
/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52794v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1527=
94v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152794v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2794v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-d=
g2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_pl=
ane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_plane_cu=
rsor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152794v3/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_ps=
r2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152794v3/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-4=
34/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg=
2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@kms_ps=
r@psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-433/igt@kms=
_psr@psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-=
dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_eu_sta=
ll@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_eud=
ebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg=
2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_eud=
ebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-=
433/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@x=
e_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-execqueues-rebind-prefetch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/sh=
ard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"=
>Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/=
igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-d=
g2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_exe=
c_system_allocator@process-many-large-execqueues-mmap-nomemset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">In=
tel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152794v3/shard-dg2-434/igt@xe_exec_system_allocator@process-many-lar=
ge-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +182 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-434/igt@xe_exe=
c_system_allocator@twice-mmap-shared-remap.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shar=
d-dg2-433/igt@xe_exec_system_allocator@twice-mmap-shared-remap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">In=
tel XE#4915</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-lnl-7/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152794v3/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_oa@=
invalid-remove-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/=
igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_p=
m@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_pm@=
d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pm@d3cold-i2c.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_pxp=
@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-d=
g2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-432/igt@xe_que=
ry@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-463/igt@xe_ren=
der_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/=
igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3618-d6164c0a2d38489ed21f76946137a58772594504/shard-dg2-435/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152794v3/shard-dg2-434/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3618-d6164c0a2d38489ed21f76946137a58772594504 -&gt; xe-pw-152=
794v3</li>
</ul>
<p>IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3618-d6164c0a2d38489ed21f76946137a58772594504: d6164c0a2d38489ed21f769=
46137a58772594504<br />
  xe-pw-152794v3: 152794v3</p>

</body>
</html>

--===============2210522314570377549==--
