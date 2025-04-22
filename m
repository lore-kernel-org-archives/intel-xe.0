Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06171C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 11:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437510E56C;
	Tue, 22 Apr 2025 11:30:16 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178010E568;
 Tue, 22 Apr 2025 11:30:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5340387184762135706=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Ensure?=
 =?utf-8?q?_enough_lines_between_delayed_VBlank_and_VBlank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 11:30:15 -0000
Message-ID: <174532141571.25354.16908468858574213735@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422091746.529878-1-jouni.hogander@intel.com>
In-Reply-To: <20250422091746.529878-1-jouni.hogander@intel.com>
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

--===============5340387184762135706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Ensure enough lines between delayed VBlank and VBlank (rev2)
URL   : https://patchwork.freedesktop.org/series/147935/
State : failure

== Summary ==

CI Bug Log - changes from xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe_FULL -> xe-pw-147935v2_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-147935v2_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147935v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147935v2_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [SKIP][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378]) -> ([DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-3/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-3/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-6/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-6/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-6/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-5/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-5/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-5/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-1/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-1/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-8/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-6/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [DMESG-WARN][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [SKIP][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457] / [Intel XE#3428]) -> ([DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88], [DMESG-WARN][89], [DMESG-WARN][90], [DMESG-WARN][91], [DMESG-WARN][92], [DMESG-WARN][93], [DMESG-WARN][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97], [DMESG-WARN][98], [DMESG-WARN][99], [DMESG-WARN][100], [DMESG-WARN][101], [DMESG-WARN][102])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-7/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-8/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-1/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-6/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-6/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [SKIP][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128]) ([Intel XE#378]) -> ([DMESG-WARN][129], [DMESG-WARN][130], [DMESG-WARN][131], [DMESG-WARN][132], [DMESG-WARN][133], [DMESG-WARN][134], [DMESG-WARN][135], [DMESG-WARN][136], [DMESG-WARN][137], [DMESG-WARN][138], [DMESG-WARN][139], [DMESG-WARN][140], [DMESG-WARN][141], [DMESG-WARN][142], [DMESG-WARN][143], [DMESG-WARN][144], [DMESG-WARN][145], [DMESG-WARN][146], [DMESG-WARN][147], [DMESG-WARN][148], [DMESG-WARN][149], [DMESG-WARN][150], [DMESG-WARN][151], [DMESG-WARN][152], [DMESG-WARN][153])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-3/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-8/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-8/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-2/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-1/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-1/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([SKIP][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179]) ([Intel XE#378]) -> ([DMESG-WARN][180], [DMESG-WARN][181], [DMESG-WARN][182], [DMESG-WARN][183], [DMESG-WARN][184], [DMESG-WARN][185], [DMESG-WARN][186], [DMESG-WARN][187], [DMESG-WARN][188], [DMESG-WARN][189], [DMESG-WARN][190], [DMESG-WARN][191], [DMESG-WARN][192], [DMESG-WARN][193], [DMESG-WARN][194], [DMESG-WARN][195], [DMESG-WARN][196], [DMESG-WARN][197], [DMESG-WARN][198], [DMESG-WARN][199], [DMESG-WARN][200], [DMESG-WARN][201], [DMESG-WARN][202], [DMESG-WARN][203], [DMESG-WARN][204])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-463/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-463/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-463/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-466/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-466/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-463/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-466/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@load.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * Linux: xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe -> xe-pw-147935v2

  IGT_8329: 8329
  xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe: dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe
  xe-pw-147935v2: 147935v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/index.html

--===============5340387184762135706==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Ensure enough lines betwee=
n delayed VBlank and VBlank (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147935/">https://patchwork.freedesktop.org/series/147935/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147935v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147935v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc=
464cbbe_FULL -&gt; xe-pw-147935v2_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-147935v2_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147935v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1479=
35v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464=
cbbe/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8b=
c464cbbe/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb=
4d8bc464cbbe/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db=
5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93=
d7db5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf0=
5c93d7db5beb4d8bc464cbbe/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c=
9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a1=
0c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80=
d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-=
dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbb=
e/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl=
-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-1/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147935v2/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-=
lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-8/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147935v2/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/sha=
rd-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-4/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147935v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/=
shard-lnl-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-6/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147935v2/shard-lnl-6/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935=
v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-3/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147935v2/shard-lnl-3/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
935v2/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-2/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147935v2/shard-lnl-2/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147935v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-7/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-7/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147935v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464=
cbbe/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8b=
c464cbbe/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb=
4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c=
93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9c=
f05c93d7db5beb4d8bc464cbbe/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c=
1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6=
a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc=
80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-297=
7-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bmg-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/=
shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464c=
bbe/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc=
464cbbe/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147935v2/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bm=
g-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147935v2/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard=
-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-1/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147935v2/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/sh=
ard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2=
/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-7/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147935v2/shard-bmg-2/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14793=
5v2/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-2/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-147935v2/shard-bmg-6/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7935v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-6/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147935v2/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147935v2/shard-bmg-3/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbb=
e/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc4=
64cbbe/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4=
d8bc464cbbe/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db=
5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c9=
3d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9c=
f05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10=
c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80=
d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977=
-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbb=
e/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc4=
64cbbe/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4=
d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db=
5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c9=
3d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9c=
f05c93d7db5beb4d8bc464cbbe/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147935v2/shard-adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-=
adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/=
shard-adlp-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147935v2/shard-adlp-9/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
935v2/shard-adlp-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@=
xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147935v2/shard-adlp-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-=
8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-8/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147935v2/shard-adlp-2/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard=
-adlp-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2=
/shard-adlp-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-3/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147935v2/shard-adlp-4/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7935v2/shard-adlp-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-4/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147935v2/shard-adlp-1/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147935v2/shard-adlp-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-ad=
lp-1/igt@xe_module_load@load.html">DMESG-WARN</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc4=
64cbbe/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb=
4d8bc464cbbe/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d=
7db5beb4d8bc464cbbe/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf=
05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10=
c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc8=
0d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
77-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464=
cbbe/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d=
8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db=
5beb4d8bc464cbbe/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c=
93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c=
9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6=
a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-=
dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/=
shard-dg2-434/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-434/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147935v2/shard-dg2-464/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147935v2/shard-dg2-464/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shar=
d-dg2-433/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147935v2/shard-dg2-433/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
35v2/shard-dg2-433/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-147935v2/shard-dg2-463/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg=
2-463/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2=
/shard-dg2-435/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-435/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147935v2/shard-dg2-432/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-43=
2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147935v2/shard-dg2-432/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe -&gt; xe-pw-147=
935v2</li>
</ul>
<p>IGT_8329: 8329<br />
  xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe: dc80d6a10c1c9cf05c93d7d=
b5beb4d8bc464cbbe<br />
  xe-pw-147935v2: 147935v2</p>

</body>
</html>

--===============5340387184762135706==--
