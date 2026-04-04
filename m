Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8427E88D70
	for <intel-xe@archiver.kernel.org>; Sat,  4 Apr 2026 07:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555210E23A;
	Sat,  4 Apr 2026 07:31:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB7010E23A;
 Sat,  4 Apr 2026 07:31:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0901971582222717551=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Wait_for_HW_clea?=
 =?utf-8?q?rance_before_issuing_the_next_TLB_inval=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Apr 2026 07:31:10 -0000
Message-ID: <177528787030.431931.8538084933924174852@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260404062250.3435419-1-fei.yang@intel.com>
In-Reply-To: <20260404062250.3435419-1-fei.yang@intel.com>
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

--===============0901971582222717551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Wait for HW clearance before issuing the next TLB inval. (rev2)
URL   : https://patchwork.freedesktop.org/series/163417/
State : failure

== Summary ==

CI Bug Log - changes from xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8_FULL -> xe-pw-163417v2_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-163417v2_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163417v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163417v2_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [SKIP][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378] / [Intel XE#7405]) -> ([DMESG-FAIL][27], [DMESG-FAIL][28], [DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50], [DMESG-FAIL][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-6/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-6/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-4/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-4/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-4/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-8/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-5/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-5/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-8/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-8/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-6/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [SKIP][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76]) ([Intel XE#2457] / [Intel XE#7405]) -> ([DMESG-FAIL][77], [DMESG-FAIL][78], [DMESG-FAIL][79], [DMESG-FAIL][80], [DMESG-FAIL][81], [DMESG-FAIL][82], [DMESG-FAIL][83], [DMESG-FAIL][84], [DMESG-FAIL][85], [DMESG-FAIL][86], [DMESG-FAIL][87], [DMESG-FAIL][88], [DMESG-FAIL][89], [DMESG-FAIL][90], [DMESG-FAIL][91], [DMESG-FAIL][92], [DMESG-FAIL][93], [DMESG-FAIL][94], [DMESG-FAIL][95], [DMESG-FAIL][96], [DMESG-FAIL][97], [DMESG-FAIL][98], [DMESG-FAIL][99], [DMESG-FAIL][100], [DMESG-FAIL][101])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-10/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-5/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-6/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-6/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-8/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-10/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-10/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-10/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-7/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-7/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-9/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-9/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-5/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405


Build changes
-------------

  * Linux: xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8 -> xe-pw-163417v2

  IGT_8847: 8847
  xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8: f0ef889ccb91830e573f8e61c637c5337a4ff6d8
  xe-pw-163417v2: 163417v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/index.html

--===============0901971582222717551==
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
<tr><td><b>Series:</b></td><td>drm/xe: Wait for HW clearance before issuing=
 the next TLB inval. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163417/">https://patchwork.freedesktop.org/series/163417/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163417v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163417v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4850-f0ef889ccb91830e573f8e61c637c5337=
a4ff6d8_FULL -&gt; xe-pw-163417v2_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-163417v2_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-163417v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1634=
17v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4f=
f6d8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c533=
7a4ff6d8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637=
c5337a4ff6d8/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61=
c637c5337a4ff6d8/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f=
8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e=
573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91=
830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889c=
cb91830e573f8e61c637c5337a4ff6d8/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef=
889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-=
f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-lnl-=
4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d=
8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
417v2/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-1/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-163417v2/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163417v2/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-8/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-8/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-163417v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-4=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-4/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163417v2/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-ln=
l-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-6/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-163417v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard=
-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-3/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-163417v2/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/sh=
ard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-2/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-163417v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2=
/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-7/igt@xe_modu=
le_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG=
-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16341=
7v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_m=
odule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163417v2/shard-lnl-5/igt@xe_module_load@load.html">DM=
ESG-FAIL</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4=
ff6d8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c53=
37a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c63=
7c5337a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8=
e61c637c5337a4ff6d8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e5=
73f8e61c637c5337a4ff6d8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb918=
30e573f8e61c637c5337a4ff6d8/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889cc=
b91830e573f8e61c637c5337a4ff6d8/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef8=
89ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f=
0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-48=
50-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
417v2/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-8/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-163417v2/shard-bmg-8/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163417v2/shard-bmg-10/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-10/i=
gt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-10/igt@xe_module_load@load.=
html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-163417v2/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg=
-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-1/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-163417v2/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-=
bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-7/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-163417v2/shard-bmg-9/igt@xe_module_load@load.html">DMESG-FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/sha=
rd-bmg-9/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-9/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-163417v2/shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/=
shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-2/igt@xe_modul=
e_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-163417v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417=
v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-3/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163417v2/shard-bmg-3/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
417v2/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/shard-bmg-5/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-163417v2/shard-bmg-5/igt@xe_module_load@load.html">=
DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8 -&gt; xe-pw-163=
417v2</li>
</ul>
<p>IGT_8847: 8847<br />
  xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8: f0ef889ccb91830e573f8e6=
1c637c5337a4ff6d8<br />
  xe-pw-163417v2: 163417v2</p>

</body>
</html>

--===============0901971582222717551==--
