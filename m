Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F3EFC9EC3
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 01:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEC710E106;
	Sat,  7 Mar 2026 01:55:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A031310E106;
 Sat,  7 Mar 2026 01:55:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4864457237781199772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_DP=3A_Read_LTTPR_caps_foll?=
 =?utf-8?q?owed_by_DPRX_caps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 01:55:39 -0000
Message-ID: <177284853963.329708.7950375978046548195@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
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

--===============4864457237781199772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DP: Read LTTPR caps followed by DPRX caps
URL   : https://patchwork.freedesktop.org/series/162641/
State : failure

== Summary ==

CI Bug Log - changes from xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2_FULL -> xe-pw-162641v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-162641v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162641v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162641v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [SKIP][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378] / [Intel XE#7405]) -> ([DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-7/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-2/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-3/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-3/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-3/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-7/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-8/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-6/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [SKIP][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457] / [Intel XE#7405]) -> ([ABORT][78], [ABORT][79], [ABORT][80], [ABORT][81], [ABORT][82], [ABORT][83], [ABORT][84], [ABORT][85], [ABORT][86], [ABORT][87], [ABORT][88], [ABORT][89], [ABORT][90], [ABORT][91], [ABORT][92], [ABORT][93], [ABORT][94], [ABORT][95], [ABORT][96], [ABORT][97], [ABORT][98], [ABORT][99], [ABORT][100])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-7/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-7/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-8/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-5/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-7/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-3/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-8/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-9/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-3/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-10/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-10/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-2/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-10/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-10/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-9/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-9/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405


Build changes
-------------

  * Linux: xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2 -> xe-pw-162641v1

  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2: ce63d46cc8fc3bb754efb93026b55acaa616cfa2
  xe-pw-162641v1: 162641v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/index.html

--===============4864457237781199772==
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
<tr><td><b>Series:</b></td><td>DP: Read LTTPR caps followed by DPRX caps</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162641/">https://patchwork.freedesktop.org/series/162641/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162641v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162641v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4670-ce63d46cc8fc3bb754efb93026b55acaa=
616cfa2_FULL -&gt; xe-pw-162641v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-162641v1_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-162641v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1626=
41v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616=
cfa2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55aca=
a616cfa2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b5=
5acaa616cfa2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb930=
26b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754ef=
b93026b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb7=
54efb93026b55acaa616cfa2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc=
3bb754efb93026b55acaa616cfa2/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46c=
c8fc3bb754efb93026b55acaa616cfa2/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63=
d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-=
ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-8/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa=
2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
641v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-162641v1/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162641v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-8/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-162641v1/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-4=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-4/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-162641v1/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-ln=
l-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-6/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-162641v1/shard-lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard=
-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-3/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-162641v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/sh=
ard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-2/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-162641v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1=
/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-7/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-162641v1/shard-lnl-7/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16264=
1v1/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-lnl-5/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-162641v1/shard-lnl-5/igt@xe_module_load@load.html">DM=
ESG-WARN</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616=
cfa2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55aca=
a616cfa2/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b5=
5acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb930=
26b55acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754ef=
b93026b55acaa616cfa2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb7=
54efb93026b55acaa616cfa2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc=
3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46c=
c8fc3bb754efb93026b55acaa616cfa2/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63=
d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4670-=
ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shard-bmg=
-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616c=
fa2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7=
405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162641v1/shard-bmg-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-4/igt@xe_m=
odule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-162641v1/shard-bmg-8/igt@xe_module_load@load.html">ABORT</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/sha=
rd-bmg-8/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-8/igt@xe_module_load@l=
oad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-162641v1/shard-bmg-10/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-10/i=
gt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-162641v1/shard-bmg-1/igt@xe_module_load@load.html">=
ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16264=
1v1/shard-bmg-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-7/igt@xe_module=
_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162641v1/shard-bmg-7/igt@xe_module_load@load.html">ABORT</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bm=
g-9/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-9/igt@xe_module_load@load.h=
tml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162641v1/shard-bmg-9/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-2/igt@xe_m=
odule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-162641v1/shard-bmg-2/igt@xe_module_load@load.html">ABORT</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/sha=
rd-bmg-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-6/igt@xe_module_load@l=
oad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-162641v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-3/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-162641v1/shard-bmg-3/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641=
v1/shard-bmg-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162641v1/shard-bmg-5/igt@xe_module_=
load@load.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2 -&gt; xe-pw-162=
641v1</li>
</ul>
<p>IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4670-ce63d46cc8fc3bb754efb93026b55acaa616cfa2: ce63d46cc8fc3bb754efb93=
026b55acaa616cfa2<br />
  xe-pw-162641v1: 162641v1</p>

</body>
</html>

--===============4864457237781199772==--
