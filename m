Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6070C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 04:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7110E283;
	Thu, 26 Jun 2025 04:47:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3010E071;
 Thu, 26 Jun 2025 04:47:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8488806479208659453=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_More_missing_XeLP_workarou?=
 =?utf-8?q?nds_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Jun 2025 04:47:24 -0000
Message-ID: <175091324472.111285.3774300695036879404@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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

--===============8488806479208659453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: More missing XeLP workarounds (rev5)
URL   : https://patchwork.freedesktop.org/series/149097/
State : failure

== Summary ==

CI Bug Log - changes from xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19_FULL -> xe-pw-149097v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149097v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149097v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149097v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [SKIP][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28]) ([Intel XE#378]) -> ([DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50], [DMESG-FAIL][51], [DMESG-FAIL][52], [DMESG-FAIL][53])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-4/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-7/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-7/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-7/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-8/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-4/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-3/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-4/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-2/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-2/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-3/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-3/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-3/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-2/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-1/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-4/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-4/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-4/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-8/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-8/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-8/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [SKIP][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78]) ([Intel XE#2457]) -> ([DMESG-FAIL][79], [DMESG-FAIL][80], [DMESG-FAIL][81], [DMESG-FAIL][82], [DMESG-FAIL][83], [DMESG-FAIL][84], [DMESG-FAIL][85], [DMESG-FAIL][86], [DMESG-FAIL][87], [DMESG-FAIL][88], [DMESG-FAIL][89], [DMESG-FAIL][90], [DMESG-FAIL][91], [DMESG-FAIL][92], [DMESG-FAIL][93], [DMESG-FAIL][94], [DMESG-FAIL][95], [DMESG-FAIL][96], [DMESG-FAIL][97], [DMESG-FAIL][98], [DMESG-FAIL][99], [DMESG-FAIL][100], [DMESG-FAIL][101], [DMESG-FAIL][102], [DMESG-FAIL][103])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-7/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-4/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-1/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-2/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-4/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-6/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-6/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-7/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-5/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-2/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-2/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-6/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-4/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-4/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-5/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-149097v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-adlp:         [PASS][104] -> [SKIP][105] ([Intel XE#2134])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@fbdev@read.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3767]) +15 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-adlp:         [PASS][107] -> [DMESG-WARN][108] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#4543])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1124]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][112] -> [DMESG-FAIL][113] ([Intel XE#4543])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#787]) +76 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2907])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][117] -> [INCOMPLETE][118] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][119] ([Intel XE#3124])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][120] ([Intel XE#1727] / [Intel XE#3113])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][121] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4416]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#306])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#373])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#1178]) +2 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#455]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-adlp:         [PASS][127] -> [SKIP][128] ([Intel XE#4950]) +10 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][129] -> [FAIL][130] ([Intel XE#1874]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#651]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-adlp:         [PASS][132] -> [SKIP][133] ([Intel XE#4947])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#653]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1129])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1489])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1127])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1126])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4837]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1392]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][143] -> [DMESG-WARN][144] ([Intel XE#3876])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4915]) +57 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-adlp:         [PASS][146] -> [SKIP][147] ([Intel XE#4945]) +29 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][148] ([Intel XE#4917])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4733])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#944]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4130])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#4427]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][155] ([Intel XE#3908]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][157] ([Intel XE#4543]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#3124]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][165] -> [PASS][166] +3 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-464/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp4.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#3098]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#301]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][173] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][175] ([Intel XE#1874]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1392]) -> [PASS][178] +4 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#4812]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-adlp:         [SKIP][181] ([Intel XE#455]) -> [SKIP][182] ([Intel XE#4950])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][183] ([Intel XE#316]) -> [SKIP][184] ([Intel XE#4947])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][185] ([Intel XE#1124]) -> [SKIP][186] ([Intel XE#4947]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         [SKIP][187] ([Intel XE#2191]) -> [SKIP][188] ([Intel XE#4950])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][189] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][190] ([Intel XE#4947]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][194] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         [SKIP][195] ([Intel XE#2907]) -> [SKIP][196] ([Intel XE#4947])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         [SKIP][197] ([Intel XE#4418]) -> [SKIP][198] ([Intel XE#2351] / [Intel XE#4947])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         [SKIP][199] ([Intel XE#373]) -> [SKIP][200] ([Intel XE#4950]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-single.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         [SKIP][201] ([Intel XE#308]) -> [SKIP][202] ([Intel XE#4950])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         [SKIP][203] ([Intel XE#309]) -> [SKIP][204] ([Intel XE#4950])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         [SKIP][205] ([Intel XE#323]) -> [SKIP][206] ([Intel XE#4950])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-adlp:         [SKIP][207] ([Intel XE#455]) -> [SKIP][208] ([Intel XE#4947])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_dsc@dsc-fractional-bpp.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         [SKIP][209] ([Intel XE#1137]) -> [SKIP][210] ([Intel XE#4950])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         [SKIP][211] ([Intel XE#310]) -> [SKIP][212] ([Intel XE#4950])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         [SKIP][213] ([Intel XE#455]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#4947])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][215] ([Intel XE#651]) -> [SKIP][216] ([Intel XE#4947]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][217] ([Intel XE#656]) -> [SKIP][218] ([Intel XE#4947]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][219] ([Intel XE#656]) -> [SKIP][220] ([Intel XE#2351] / [Intel XE#4947])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][221] ([Intel XE#653]) -> [SKIP][222] ([Intel XE#4947]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         [SKIP][223] ([Intel XE#346]) -> [SKIP][224] ([Intel XE#4947])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_joiner@basic-big-joiner.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         [SKIP][225] ([Intel XE#870]) -> [SKIP][226] ([Intel XE#4947])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_pm_backlight@bad-brightness.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-adlp:         [SKIP][227] ([Intel XE#1489]) -> [SKIP][228] ([Intel XE#4947]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         [SKIP][229] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][230] ([Intel XE#4947]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][231] ([Intel XE#1127]) -> [SKIP][232] ([Intel XE#4950])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         [SKIP][233] ([Intel XE#2168]) -> [SKIP][234] ([Intel XE#4950])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_vrr@lobf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_vrr@lobf.html

  * igt@xe_configfs@survivability-mode:
    - shard-adlp:         [SKIP][235] ([Intel XE#5249]) -> [SKIP][236] ([Intel XE#4945])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_configfs@survivability-mode.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-adlp:         [SKIP][237] ([Intel XE#5308]) -> [SKIP][238] ([Intel XE#4945])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_eu_stall@unprivileged-access.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-adlp:         [SKIP][239] ([Intel XE#4837]) -> [SKIP][240] ([Intel XE#4945]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         [SKIP][241] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][242] ([Intel XE#4945])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         [SKIP][243] ([Intel XE#288]) -> [SKIP][244] ([Intel XE#4945]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - shard-adlp:         [SKIP][245] ([Intel XE#4915]) -> [SKIP][246] ([Intel XE#4945]) +46 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html

  * igt@xe_oa@blocking:
    - shard-adlp:         [SKIP][247] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][248] ([Intel XE#4945]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_oa@blocking.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_oa@blocking.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         [SKIP][249] ([Intel XE#1337]) -> [SKIP][250] ([Intel XE#4945])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         [SKIP][251] ([Intel XE#944]) -> [SKIP][252] ([Intel XE#4945])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_query@multigpu-query-engines.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_query@multigpu-query-engines.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19 -> xe-pw-149097v5

  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19: bd57aee20daefb7b0dfe9017663668c92115ff19
  xe-pw-149097v5: 149097v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/index.html

--===============8488806479208659453==
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
<tr><td><b>Series:</b></td><td>More missing XeLP workarounds (rev5)</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149097/">https://patchwork.freedesktop.org/series/149097/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149097v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149097v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3302-bd57aee20daefb7b0dfe9017663668c92=
115ff19_FULL -&gt; xe-pw-149097v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149097v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149097v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1490=
97v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@4-tiled-32bpp-rotate-180:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-435/igt@kms_big_fb@4-=
tiled-32bpp-rotate-180.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115=
ff19/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c9=
2115ff19/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe90176636=
68c92115ff19/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017=
663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe=
9017663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b=
0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20dae=
fb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee2=
0daefb7b0dfe9017663668c92115ff19/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57=
aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-=
bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-6/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff1=
9/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl=
-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-3/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149097v5/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-=
lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-2/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149097v5/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/sha=
rd-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149097v5/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/=
shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-1/igt@xe_modul=
e_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149097v5/shard-lnl-4/igt@xe_module_load@load.html">DMESG-=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097=
v5/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-4/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-lnl-8/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
097v5/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-8/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149097v5/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149097v5/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-7/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-7/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149097v5/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-5=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-lnl-5/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149097v5/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</=
li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115=
ff19/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c9=
2115ff19/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe90176636=
68c92115ff19/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017=
663668c92115ff19/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe=
9017663668c92115ff19/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b=
0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee20dae=
fb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57aee2=
0daefb7b0dfe9017663668c92115ff19/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-bd57=
aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3302-=
bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-5=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-2/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149097v5/shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bm=
g-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard=
-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-7/igt@xe_module_loa=
d@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149097v5/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/sh=
ard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-1/igt@xe_module_=
load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5=
/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_modu=
le_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149097v5/shard-bmg-8/igt@xe_module_load@load.html">DMESG=
-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14909=
7v5/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_m=
odule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@xe_module_load@load.html">DM=
ESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9097v5/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-3/igt@x=
e_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-4/igt@xe_module_load@load.html"=
>DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149097v5/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-4/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149097v5/shard-bmg-5/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149097v5/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149097v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@fbdev@r=
ead.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149097v5/shard-adlp-9/igt@fbdev@read.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-434/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-1/igt@kms_async=
_flips@invalid-async-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp=
-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/sha=
rd-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#=
4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_content_protection@lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-rapid-movement-64x64.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_curs=
or_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_fr=
ontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_fault_mode@invalid-=
va.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-436/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +57 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec=
_threads@threads-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_pxp@display-black-pxp-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149097v5/shard-dg2-432/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427">Intel XE#4427</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5=
/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1490=
97v5/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149097v5/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149097v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-4=
36/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_fl=
ip@blocking-absolute-wf_vblank-interruptible@a-dp4.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-=
464/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp4.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_fl=
ip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/=
shard-dg2-433/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fli=
p@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#=
4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149097v5/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-435/igt@kms_f=
lip@flip-vs-expired-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/sha=
rd-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1490=
97v5/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg=
2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec=
_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4812">Intel XE#4812</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-6/igt@x=
e_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big=
_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_b=
ig_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_bw@=
connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/s=
hard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_ccs=
@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097=
v5/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2-436/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_ccs=
@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cdc=
lk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cha=
melium_frames@hdmi-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@km=
s_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cur=
sor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel =
XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149097v5/shard-adlp-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_dsc=
@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fea=
ture_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fli=
p@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149097v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32=
bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097=
v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149097v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_pm_=
backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_pm_=
backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_psr=
2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-=
adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_psr=
@fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_rot=
ation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-=
adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@kms_vrr=
@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@kms_vrr@lobf.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">I=
ntel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_conf=
igfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_eu_s=
tall@unprivileged-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5308">Intel XE#5308</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_eu=
_stall@unprivileged-access.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_eude=
bug_online@breakpoint-not-in-debug-mode.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-a=
dlp-9/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE=
#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_evic=
t@evict-beng-small-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/i=
gt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefe=
tch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec=
_fault_mode@twice-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">I=
ntel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149097v5/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-use=
rptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_exec=
_system_allocator@once-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard=
-adlp-9/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_oa@b=
locking.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_oa@bl=
ocking.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_pat@=
display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19/shard-adlp-4/igt@xe_quer=
y@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149097v5/shard-adlp-9/igt@xe_quer=
y@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19 -&gt; xe-pw-149=
097v5</li>
</ul>
<p>IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3302-bd57aee20daefb7b0dfe9017663668c92115ff19: bd57aee20daefb7b0dfe901=
7663668c92115ff19<br />
  xe-pw-149097v5: 149097v5</p>

</body>
</html>

--===============8488806479208659453==--
