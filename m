Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE67FC4450A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 03:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F4D10E113;
	Wed, 15 Jul 2026 03:01:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9475510E113;
 Wed, 15 Jul 2026 03:01:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8364168390803555431=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Recommend_Gu?=
 =?utf-8?q?C_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jul 2026 03:01:34 -0000
Message-ID: <178408449459.190631.706289930358071646@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714182904.620871-7-julia.filipchuk@intel.com>
In-Reply-To: <20260714182904.620871-7-julia.filipchuk@intel.com>
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

--===============8364168390803555431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL (rev3)
URL   : https://patchwork.freedesktop.org/series/168118/
State : failure

== Summary ==

CI Bug Log - changes from xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d_FULL -> xe-pw-168118v3_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-168118v3_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168118v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168118v3_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [SKIP][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378] / [Intel XE#7405]) -> ([DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-8/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-3/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-2/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-7/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-5/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-5/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-3/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-8/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-8/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-8/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-3/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [PASS][53], [PASS][54], [PASS][55], [SKIP][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457] / [Intel XE#7405]) -> ([DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [DMESG-WARN][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97], [DMESG-WARN][98], [DMESG-WARN][99], [DMESG-WARN][100], [DMESG-WARN][101], [DMESG-WARN][102])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-10/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-10/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-6/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-2/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-7/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-4/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-4/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-6/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-9/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-9/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-6/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-6/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-3/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405


Build changes
-------------

  * Linux: xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d -> xe-pw-168118v3

  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d: 381c2c353cae7ef6725a3cb7db597d0e2067537d
  xe-pw-168118v3: 168118v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/index.html

--===============8364168390803555431==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Recommend GuC v70.65.0 for BMG, =
LNL, PTL (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168118/">https://patchwork.freedesktop.org/series/168118/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168118v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168118v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5401-381c2c353cae7ef6725a3cb7db597d0e2=
067537d_FULL -&gt; xe-pw-168118v3_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-168118v3_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168118v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1681=
18v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067=
537d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e=
2067537d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db59=
7d0e2067537d/shard-lnl-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7=
db597d0e2067537d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a=
3cb7db597d0e2067537d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6=
725a3cb7db597d0e2067537d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae=
7ef6725a3cb7db597d0e2067537d/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c35=
3cae7ef6725a3cb7db597d0e2067537d/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c=
2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-=
381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537=
d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
118v3/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-1/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168118v3/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168118v3/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-8/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168118v3/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-4=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-4/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168118v3/shard-lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-ln=
l-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-6/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard=
-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168118v3/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/sh=
ard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-2/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-168118v3/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3=
/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-7/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-168118v3/shard-lnl-7/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16811=
8v3/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-lnl-5/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168118v3/shard-lnl-5/igt@xe_module_load@load.html">DM=
ESG-WARN</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard=
-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/s=
hard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e206753=
7d/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e20=
67537d/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d=
0e2067537d/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db=
597d0e2067537d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3=
cb7db597d0e2067537d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef67=
25a3cb7db597d0e2067537d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7=
ef6725a3cb7db597d0e2067537d/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353=
cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2=
c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5401-3=
81c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-54=
01-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067=
537d/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168118v3/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-4/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168118v3/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-8=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168118v3/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-=
bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-10/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168118v3/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/s=
hard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-1/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v=
3/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168118v3/shard-bmg-7/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1681=
18v3/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168118v3/shard-bmg-9/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68118v3/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-2/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-6/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168118v3/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-3=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168118v3/shard-bmg-3/igt@xe_module_load@load=
.html">DMESG-WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d -&gt; xe-pw-168=
118v3</li>
</ul>
<p>IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5401-381c2c353cae7ef6725a3cb7db597d0e2067537d: 381c2c353cae7ef6725a3cb=
7db597d0e2067537d<br />
  xe-pw-168118v3: 168118v3</p>

</body>
</html>

--===============8364168390803555431==--
