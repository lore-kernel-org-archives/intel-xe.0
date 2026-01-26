Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF62D13C20
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 14:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD61210E440;
	Mon, 26 Jan 2026 14:32:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEAD10E199;
 Mon, 26 Jan 2026 14:32:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3250735817304938948=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Enable_ATS=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 14:32:43 -0000
Message-ID: <176943796337.192609.8854814998402547044@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126125207.1119351-1-dev@lankhorst.se>
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
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

--===============3250735817304938948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable ATS.
URL   : https://patchwork.freedesktop.org/series/160645/
State : failure

== Summary ==

CI Bug Log - changes from xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b_FULL -> xe-pw-160645v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-160645v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160645v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160645v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [SKIP][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378]) -> ([DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-2/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-3/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-2/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-3/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-8/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [SKIP][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457]) -> ([DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [DMESG-WARN][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97], [DMESG-WARN][98], [DMESG-WARN][99], [DMESG-WARN][100], [DMESG-WARN][101], [DMESG-WARN][102])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-8/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-4/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * IGT: IGT_8716 -> IGT_8717
  * Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -> xe-pw-160645v1

  IGT_8716: 8716
  IGT_8717: 8717
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b
  xe-pw-160645v1: 160645v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/index.html

--===============3250735817304938948==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable ATS.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160645/">https://patchwork.freedesktop.org/series/160645/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160645v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-160645v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33b=
e53287b_FULL -&gt; xe-pw-160645v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-160645v1_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-160645v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1606=
45v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-2/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53=
287b/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33=
be53287b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfc=
bf33be53287b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be=
7dfcbf33be53287b/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b=
64be7dfcbf33be53287b/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5=
595b64be7dfcbf33be53287b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b1=
21d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5=
b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7a=
f7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-=
6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287=
b/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl=
-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-160645v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-=
lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-8/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-160645v1/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/sha=
rd-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/=
shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645=
v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160645v1/shard-lnl-3/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
645v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-160645v1/shard-lnl-2/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
160645v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-7/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-7/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-160645v1/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-5=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-lnl-5/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160645v1/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b=
/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53=
287b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33=
be53287b/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfc=
bf33be53287b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be=
7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b=
64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5=
595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b1=
21d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5=
b6b121d5595b64be7dfcbf33be53287b/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7a=
f7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-=
6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be5=
3287b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/sha=
rd-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-4/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-160645v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/=
shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-8/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16064=
5v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-160645v1/shard-bmg-10/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-160645v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-1/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160645v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-=
7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-7/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-b=
mg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-160645v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shar=
d-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/s=
hard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160645v1/shard-bmg-2/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160645v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-W=
ARN</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8716 -&gt; IGT_8717</li>
<li>Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -&gt; xe-pw-160=
645v1</li>
</ul>
<p>IGT_8716: 8716<br />
  IGT_8717: 8717<br />
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64b=
e7dfcbf33be53287b<br />
  xe-pw-160645v1: 160645v1</p>

</body>
</html>

--===============3250735817304938948==--
