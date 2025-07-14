Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ADC83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 11:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7028010E17A;
	Mon, 14 Jul 2025 11:44:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFF210E17A;
 Mon, 14 Jul 2025 11:44:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3474719988148434567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/uapi=3A_Add_DRM=5FX?=
 =?utf-8?q?E=5FQUERY=5FCONFIG=5FFLAG=5FHAS=5FDISABLE=5FNULL=5FQUERY_and_exec?=
 =?utf-8?q?_queue_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 11:44:48 -0000
Message-ID: <175249348829.158351.11936251532865767998@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714085436.1295787-1-nitin.r.gote@intel.com>
In-Reply-To: <20250714085436.1295787-1-nitin.r.gote@intel.com>
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

--===============3474719988148434567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY and exec queue control
URL   : https://patchwork.freedesktop.org/series/151560/
State : failure

== Summary ==

CI Bug Log - changes from xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822_FULL -> xe-pw-151560v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151560v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151560v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151560v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [SKIP][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28]) ([Intel XE#378]) -> ([DMESG-FAIL][29], [DMESG-FAIL][30], [DMESG-FAIL][31], [DMESG-FAIL][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [DMESG-FAIL][35], [DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38], [DMESG-FAIL][39], [DMESG-FAIL][40], [DMESG-FAIL][41], [DMESG-FAIL][42], [DMESG-FAIL][43], [DMESG-FAIL][44], [DMESG-FAIL][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [DMESG-FAIL][48], [DMESG-FAIL][49], [DMESG-FAIL][50], [DMESG-FAIL][51], [DMESG-FAIL][52], [DMESG-FAIL][53])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-4/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-6/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-4/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-1/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-6/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-2/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-7/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-7/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-8/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-8/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-4/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-8/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-6/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-1/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-8/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [SKIP][78], [PASS][79]) ([Intel XE#2457]) -> ([DMESG-FAIL][80], [DMESG-FAIL][81], [DMESG-FAIL][82], [DMESG-FAIL][83], [DMESG-FAIL][84], [DMESG-FAIL][85], [DMESG-FAIL][86], [DMESG-FAIL][87], [DMESG-FAIL][88], [DMESG-FAIL][89], [DMESG-FAIL][90], [DMESG-FAIL][91], [DMESG-FAIL][92], [DMESG-FAIL][93], [DMESG-FAIL][94], [DMESG-FAIL][95], [DMESG-FAIL][96], [DMESG-FAIL][97], [DMESG-FAIL][98], [DMESG-FAIL][99], [DMESG-FAIL][100], [DMESG-FAIL][101], [DMESG-FAIL][102], [DMESG-FAIL][103], [DMESG-FAIL][104])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-1/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-1/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-8/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-8/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-5/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-6/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-6/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-3/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-7/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-7/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-8/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-6/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-6/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-2/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-4/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-4/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-5/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-151560v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-adlp:         [PASS][105] -> [SKIP][106] ([Intel XE#2134])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@fbdev@nullptr.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1125])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1124]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#316])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][110] -> [SKIP][111] ([Intel XE#4947]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2351] / [Intel XE#4947])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1124]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][114] -> [DMESG-FAIL][115] ([Intel XE#4543]) +6 other tests dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#607])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#610])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2191])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][121] -> [INCOMPLETE][122] ([Intel XE#3862]) +1 other test incomplete
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#787]) +139 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#787]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][125] -> [INCOMPLETE][126] ([Intel XE#3124])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][127] -> [DMESG-WARN][128] ([Intel XE#1727] / [Intel XE#3113])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][129] -> [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#3113])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2907])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4418])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4417]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4416]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#373]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#373]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#307])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#307]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#1178]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#455]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][141] -> [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#4950]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][144] -> [SKIP][145] ([Intel XE#4950]) +9 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#4422])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][147] -> [INCOMPLETE][148] ([Intel XE#2049] / [Intel XE#4842]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#310])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][150] -> [DMESG-WARN][151] ([Intel XE#4543]) +8 other tests dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#455]) +13 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][153] -> [DMESG-FAIL][154] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#651]) +13 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#656]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#651]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#653]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1158])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#653]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2927])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][162] ([Intel XE#5195]) +4 other tests fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#5021])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#5020])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#309]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][166] -> [FAIL][167] ([Intel XE#718])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#1129])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][169] -> [FAIL][170] ([Intel XE#4741])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#4962])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1489]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1122])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#4947])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#3414])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#3414])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#330])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1091] / [Intel XE#2849])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_configfs@survivability-mode:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#5249])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1126])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#4837]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#4837]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#4518]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#4519])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][187] -> [SKIP][188] ([Intel XE#1392]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#1392])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#288]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#288]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#2360])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2360]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#4945]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#4915]) +61 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#4915]) +126 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-adlp:         [PASS][197] -> [SKIP][198] ([Intel XE#4945]) +26 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][199] ([Intel XE#4917])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-formats:
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@xe_oa@oa-formats.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1337])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#2284] / [Intel XE#366])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][204] -> [ABORT][205] ([Intel XE#4847])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#4733])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#4273])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#4208]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@core_getversion@basic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@core_getversion@basic.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [DMESG-FAIL][210] ([Intel XE#4543]) -> [PASS][211] +8 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_async_flips@crc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@kms_async_flips@crc.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][212] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][214] ([Intel XE#4543]) -> [PASS][215] +13 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [DMESG-WARN][216] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][218] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][221] +2 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208] / [i915#2575]) -> [PASS][223] +6 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_getfb@getfb2-handle-zero.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#2883]) -> [PASS][225] +6 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@xe_exec_balancer@virtual-all-active:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208]) -> [PASS][227] +16 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exec_balancer@virtual-all-active.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@xe_exec_balancer@virtual-all-active.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1392]) -> [PASS][229] +5 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance0:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#5313]) -> [PASS][231] +2 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-435/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance0.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][232] ([Intel XE#1124]) -> [SKIP][233] ([Intel XE#2351] / [Intel XE#4947])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][235] ([Intel XE#316])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-adlp:         [SKIP][236] ([Intel XE#316]) -> [SKIP][237] ([Intel XE#4947])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][238] ([Intel XE#1124]) -> [SKIP][239] ([Intel XE#4947])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         [SKIP][240] ([Intel XE#2191]) -> [SKIP][241] ([Intel XE#4950])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][242] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][243] ([Intel XE#4947]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][245] ([Intel XE#455] / [Intel XE#787])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][246] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][247] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][250] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][251] ([Intel XE#1727] / [Intel XE#3113])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         [SKIP][252] ([Intel XE#306]) -> [SKIP][253] ([Intel XE#4950])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_chamelium_color@ctm-0-25.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         [SKIP][254] ([Intel XE#373]) -> [SKIP][255] ([Intel XE#4950]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#4208] / [i915#2575]) -> [SKIP][257] ([Intel XE#455])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         [SKIP][258] ([Intel XE#455]) -> [SKIP][259] ([Intel XE#4950]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         [SKIP][260] ([Intel XE#309]) -> [SKIP][261] ([Intel XE#4950]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][262] ([Intel XE#455]) -> [SKIP][263] ([Intel XE#4947]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#4208]) -> [SKIP][265] ([Intel XE#4356])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-adlp:         [SKIP][266] ([Intel XE#455]) -> [SKIP][267] ([Intel XE#2351] / [Intel XE#4947])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_dsc@dsc-with-formats.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#4208] / [i915#2575]) -> [SKIP][269] ([Intel XE#701])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         [SKIP][270] ([Intel XE#310]) -> [SKIP][271] ([Intel XE#4950]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][272] ([Intel XE#4543]) -> [SKIP][273] ([Intel XE#4950]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [SKIP][275] ([Intel XE#455])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][276] ([Intel XE#656]) -> [SKIP][277] ([Intel XE#2351] / [Intel XE#4947]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][278] ([Intel XE#656]) -> [SKIP][279] ([Intel XE#4947]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#4208]) -> [SKIP][281] ([Intel XE#651]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][282] ([Intel XE#651]) -> [SKIP][283] ([Intel XE#4947]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][285] ([Intel XE#651])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#653])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][288] ([Intel XE#653]) -> [SKIP][289] ([Intel XE#4947]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#2351] / [Intel XE#4947])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         [SKIP][292] ([Intel XE#346]) -> [SKIP][293] ([Intel XE#4947])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         [SKIP][294] ([Intel XE#5020]) -> [SKIP][295] ([Intel XE#4950])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-4/igt@kms_plane_multiple@tiling-4.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208]) -> [SKIP][297] ([Intel XE#870])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][298] ([Intel XE#734]) -> [SKIP][299] ([Intel XE#4947])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-adlp:         [SKIP][300] ([Intel XE#1489]) -> [SKIP][301] ([Intel XE#4947])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         [SKIP][302] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][303] ([Intel XE#4947]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][305] ([Intel XE#2939])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         [SKIP][306] ([Intel XE#3576]) -> [SKIP][307] ([Intel XE#4945])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@xe_ccs@large-ctrl-surf-copy.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         [SKIP][308] ([Intel XE#1123]) -> [SKIP][309] ([Intel XE#4945])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         [SKIP][310] ([Intel XE#4837]) -> [SKIP][311] ([Intel XE#4945]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#4208]) -> [SKIP][313] ([Intel XE#4837])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_eudebug@discovery-empty-clients.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         [SKIP][314] ([Intel XE#688]) -> [SKIP][315] ([Intel XE#4945])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         [SKIP][316] ([Intel XE#1392]) -> [SKIP][317] ([Intel XE#4945]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         [SKIP][318] ([Intel XE#288]) -> [SKIP][319] ([Intel XE#4945]) +5 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208]) -> [SKIP][321] ([Intel XE#288]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-mmap-remap:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#4208]) -> [SKIP][323] ([Intel XE#4915]) +23 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exec_system_allocator@many-mmap-remap.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@xe_exec_system_allocator@many-mmap-remap.html

  * igt@xe_exec_system_allocator@many-stride-free:
    - shard-adlp:         [SKIP][324] ([Intel XE#4915]) -> [SKIP][325] ([Intel XE#4945]) +52 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@xe_exec_system_allocator@many-stride-free.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_system_allocator@many-stride-free.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         [SKIP][326] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][327] ([Intel XE#4945])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@xe_oa@invalid-create-userspace-config.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208]) -> [SKIP][329] ([Intel XE#2541] / [Intel XE#3573])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_oa@non-sampling-read-error.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#4208]) -> [SKIP][331] ([Intel XE#4733])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5313
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8454 -> IGT_8455
  * Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -> xe-pw-151560v1

  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8455: 8455
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f01012eaf433c35da7822
  xe-pw-151560v1: 151560v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/index.html

--===============3474719988148434567==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HA=
S_DISABLE_NULL_QUERY and exec queue control</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151560/">https://patchwork.freedesktop.org/series/151560/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151560v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151560v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3406-4990310f0d4505f8a92f01012eaf433c3=
5da7822_FULL -&gt; xe-pw-151560v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151560v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151560v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1515=
60v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:=
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_mmio_probe_early.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/s=
hard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_prob=
e_early.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da=
7822/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c=
35da7822/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf=
433c35da7822/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f0101=
2eaf433c35da7822/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f=
01012eaf433c35da7822/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8=
a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d45=
05f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f=
0d4505f8a92f01012eaf433c35da7822/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990=
310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-=
4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da782=
2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl=
-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@lo=
ad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151560v1/shard-lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-=
lnl-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-1/igt@xe_module_load=
@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151560v1/shard-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/sha=
rd-lnl-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-4/igt@xe_module_l=
oad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151560v1/shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/=
shard-lnl-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151560v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560=
v1/shard-lnl-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-3/igt@xe_mo=
dule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-lnl-2/igt@xe_module_load@load.html">DME=
SG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
560v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-2/igt@xe=
_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151560v1/shard-lnl-1/igt@xe_module_load@load.html">=
DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151560v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-7/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-7/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151560v1/shard-lnl-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-5=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-lnl-5/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151560v1/shard-lnl-5/igt@xe_module_load@load.html">DMESG-FAIL</a>)</=
li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da=
7822/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c=
35da7822/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf=
433c35da7822/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f0101=
2eaf433c35da7822/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f=
01012eaf433c35da7822/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8=
a92f01012eaf433c35da7822/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d45=
05f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f=
0d4505f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-4990=
310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3406-=
4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/sh=
ard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3406-4990310f0d4505f8a92f01012eaf433c35da782=
2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-b=
mg-7/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-7/igt@xe_module_load@=
load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151560v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shar=
d-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_lo=
ad@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151560v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/s=
hard-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-8/igt@xe_module=
_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151560v1/shard-bmg-8/igt@xe_module_load@load.html">DMESG-F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v=
1/shard-bmg-8/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151560v1/shard-bmg-6/igt@xe_module_load@load.html">DMES=
G-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1515=
60v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-3/igt@xe_=
module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151560v1/shard-bmg-3/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51560v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-2/ig=
t@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-2/igt@xe_module_load@load.ht=
ml">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151560v1/shard-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-4=
/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-4/igt@xe_module_load@load=
.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151560v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG-FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bm=
g-5/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-bmg-5/igt@xe_module_load@l=
oad.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151560v1/shard-bmg-5/igt@xe_module_load@load.html">DMESG-FAIL</a>=
)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151560v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@fbdev@n=
ullptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151560v1/shard-adlp-9/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-a=
dlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/s=
hard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-h=
dmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-a=
fter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_cursor_crc@cursor-onscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-8/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_cursor_legacy@cursor-vs-=
flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_cur=
sor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
560v1/shard-adlp-9/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-tra=
nsitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463=
/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">=
Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4842">Intel XE#4842</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-modeset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-8/igt@kms_flip@basi=
c-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +8 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151560v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-2/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_plane_multiple@2x-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-=
multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-434/igt@kms_pm=
_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@kms_pm_rpm@basic-pc=
i-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4741">Intel XE#4741</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_pm_rpm@universal-planes-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@xe_eudebug_online@interrupt=
-all-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@xe_eudebug_online@set-breakp=
oint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-eudebu=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-=
null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@xe_exec_fault_mode@many-exe=
cqueues-basic-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_exec_system_allocator@thr=
eads-many-execqueues-mmap-remap-ro.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-=
nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-1/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-mmap-new-race-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@xe_exec=
_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@x=
e_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-435/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_oa@mmio-triggered-report=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@xe_oa@oa-formats.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">I=
ntel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4847">Intel XE#4847</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-464/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_asy=
nc_flips@crc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-4/igt@kms_async_f=
lips@crc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE=
#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151560v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51560v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1515=
60v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-3/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151560v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_ge=
tfb@getfb2-handle-zero.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-=
436/igt@kms_getfb@getfb2-handle-zero.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_se=
tmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-463/igt@k=
ms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exe=
c_balancer@virtual-all-active.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/igt=
@xe_exec_balancer@virtual-all-active.html">PASS</a> +16 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg=
2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance=
0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-435/igt@xe_pmu=
@engine-activity-idle@engine-drm_xe_engine_class_video_enhance0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5313">I=
ntel XE#5313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151560v1/shard-dg2-436/igt@xe_pmu@engine-activity-idle@engine-drm_x=
e_engine_class_video_enhance0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_big=
_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@km=
s_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard=
-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_big=
_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_=
big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151560v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_bw@=
connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/s=
hard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_ccs=
@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560=
v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_cc=
s@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1=
/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151560v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Int=
el XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_cha=
melium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_cha=
melium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@=
kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shar=
d-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_cur=
sor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_dir=
tyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_dsc=
@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fe=
ature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-d=
g2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_fli=
p@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/sh=
ard-adlp-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_fl=
ip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151560v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-=
ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560=
v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151560v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscre=
n-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151560v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-434/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15156=
0v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#6=
53</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1560v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_joi=
ner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-4/igt@kms_pla=
ne_multiple@tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_plane=
_multiple@tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@=
kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@kms_psr=
2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-=
adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@kms_psr=
@fbc-psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/i=
gt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151560v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@xe_ccs@=
large-ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3576">Intel XE#3576</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_ccs@la=
rge-ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@xe_copy=
_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@x=
e_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-3/igt@xe_eude=
bug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp=
-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_eud=
ebug@discovery-empty-clients.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-433/igt@=
xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_evic=
t_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/sha=
rd-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945=
">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-6/igt@xe_exec=
_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9/igt@xe_=
exec_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-8/igt@xe_exec=
_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-=
adlp-9/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151560v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexe=
cqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-remap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_exe=
c_system_allocator@many-mmap-remap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-46=
4/igt@xe_exec_system_allocator@many-mmap-remap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-1/igt@xe_exec=
_system_allocator@many-stride-free.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-adlp-9=
/igt@xe_exec_system_allocator@many-stride-free.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)=
 +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-adlp-2/igt@xe_oa@i=
nvalid-create-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/sh=
ard-adlp-9/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_oa@=
non-sampling-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-436/igt@xe_oa=
@non-sampling-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822/shard-dg2-466/igt@xe_pxp=
@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151560v1/shard-dg2-466/=
igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8454 -&gt; IGT_8455</li>
<li>Linux: xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822 -&gt; xe-pw-151=
560v1</li>
</ul>
<p>IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8455: 8455<br />
  xe-3406-4990310f0d4505f8a92f01012eaf433c35da7822: 4990310f0d4505f8a92f010=
12eaf433c35da7822<br />
  xe-pw-151560v1: 151560v1</p>

</body>
</html>

--===============3474719988148434567==--
